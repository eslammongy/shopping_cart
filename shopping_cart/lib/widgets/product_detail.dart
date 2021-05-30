import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/blocs.dart';
import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key, this.shopItem}) : super(key: key);

  final ShopCardItem shopItem;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<ShopCardItem> cartItems = [];

  bool _itemselected = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingBloc, ShoppingState>(
      listener: (context, state) {},
      child: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          if (state is AddingItemToCardState) {
            cartItems = state.cardItems;
          }

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Selected Product",
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 350,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Image.network(widget.shopItem.imageUrl)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  widget.shopItem.title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                                Text('\$${widget.shopItem.price}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Quantity',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (widget.shopItem.quantity > 0)
                                        setState(() {
                                          widget.shopItem.quantity--;
                                        });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    child: Text(
                                        widget.shopItem.quantity.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        widget.shopItem.quantity++;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.pink,
                            onPressed: () {
                              if (_itemselected == false) {
                                ShopCardItem cartItem = ShopCardItem(
                                  imageUrl: widget.shopItem.imageUrl,
                                  title: widget.shopItem.title,
                                  price: widget.shopItem.price,
                                  quantity: widget.shopItem.quantity,
                                );

                                cartItems.add(cartItem);

                                BlocProvider.of<ShoppingBloc>(context)
                                  ..add(AddedItemToCardEvent(
                                      cardItems: cartItems));

                                setState(() {
                                  _itemselected = true;
                                });
                              } else
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: BlocProvider.of<ShoppingBloc>(
                                          context),
                                      child: ShoppingCardPage(),
                                    ),
                                  ),
                                );
                            },
                            child: Text(
                              _itemselected ? 'Go to Cart' : 'Add to Cart',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
