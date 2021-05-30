import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/bloc/blocs.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/setting_screen.dart';
import 'package:shopping_cart/widgets/shopping_card.dart';
import 'package:shopping_cart/widgets/widgets.dart';

class ProductHomePage extends StatefulWidget {
  @override
  _ProductHomePageState createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  bool loadingDate = true;
  List<ShopCardItem> shopCardItems = [];
  List<ShopCardItem> shoppingItems;
  SharedPreferences sharedPreferences;
  bool GreenLight = false;
  bool BlueLight = false;
  bool OrangeDark = false;
  bool PupuralDark = false;
  getFavoriteTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      GreenLight = sharedPreferences.getBool("GreenLight");
      BlueLight = sharedPreferences.getBool("BlueLight");
      OrangeDark = sharedPreferences.getBool("OrangeDark");
      PupuralDark = sharedPreferences.getBool("PupuralDark");
    });
  }

  @override
  Widget build(BuildContext context) {
    getFavoriteTheme();
    return BlocListener<ShoppingBloc, ShoppingState>(
      listener: (context, state) {
        if (state is ShoppingInitialState) {
          loadingDate = true;
        } else if (state is ShoppingLoadingState) {
          shoppingItems = state.shopData.shoppingItems;
          shopCardItems = state.cartData.shoppingItems;
          loadingDate = false;
        }
        if (state is AddedItemToCardState) {
          shopCardItems = state.cardItems;
          loadingDate = false;
        }
        if (state is DeleteItemFromCardState) {
          shopCardItems = state.cardItems;
          loadingDate = false;
        }
      },
      child: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          print("Product Page State $state");
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Shopping Card",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                        ));
                      },
                      icon: Icon(Icons.settings))
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return BlocProvider.value(
                          value: BlocProvider.of<ShoppingBloc>(context),
                          child: ShoppingCardPage());
                    },
                  ));
                },
                child: Text(
                  shopCardItems.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              body: loadingDate
                  ? Center(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.8,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                      ),
                                      itemCount: 10,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                          addToCart: () {
                                            setState(() {
                                              shopCardItems
                                                  .add(shoppingItems[index]);
                                            });
                                          },
                                          productImage:
                                              shoppingItems[index].thumbnail,
                                          price: shoppingItems[index].price,
                                          title: shoppingItems[index].title,
                                          press: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (_) {
                                                return BlocProvider.value(
                                                  value: BlocProvider.of<
                                                      ShoppingBloc>(context)
                                                    ..add(AddingItemToCardEvent(
                                                        cardItems:
                                                            shopCardItems)),
                                                  child: ProductDetail(
                                                    shopItem:
                                                        shoppingItems[index],
                                                  ),
                                                );
                                              },
                                            ));
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}
