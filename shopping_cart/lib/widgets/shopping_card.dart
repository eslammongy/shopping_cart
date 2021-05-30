import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/blocs.dart';
import 'package:shopping_cart/model/shopping.dart';

class ShoppingCardPage extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCardPage> {
  List<ShopCardItem> cartItems;
  double totalAmount = 0;
  void calculateTotalAmount(List<ShopCardItem> list) {
    double res = 0;

    list.forEach((element) {
      res = res + element.price * element.quantity;
    });
    totalAmount = res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBloc, ShoppingState>(
      builder: (context, state) {
        if (state is AddedItemToCardState) {
          cartItems = state.cardItems;
          calculateTotalAmount(cartItems);
        }
        if (state is ShoppingLoadingState) {
          cartItems = state.cartData.shoppingItems;
          calculateTotalAmount(cartItems);
        }
        if (state is AddingItemToCardState) {
          cartItems = state.cardItems;
          calculateTotalAmount(cartItems);
        }
        if (state is DeleteItemFromCardState) {
          cartItems = state.cardItems;
          calculateTotalAmount(cartItems);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Shopping Cart',
            ),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 3,
                    color: Color(0xFF000000).withOpacity(0.20),
                  ),
                  BoxShadow(
                    offset: Offset(0, -1),
                    blurRadius: 4,
                    color: Color(0xFF000000).withOpacity(0.14),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(12),
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Total Amount',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Text('\$${totalAmount.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          body: cartItems == null || cartItems.length == 0
              ? Center(
                  child: Text(
                  'Your Shopping Cart is Empty',
                  style: TextStyle(fontSize: 25),
                ))
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Image.network(
                                      cartItems[index].thumbnail,
                                      height: 64,
                                      width: 64,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(cartItems[index].title),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () {
                                      setState(() {
                                        if (state is ShoppingLoadingState) {
                                          state.cartData.shoppingItems
                                              .removeAt(index);
                                          calculateTotalAmount(cartItems);
                                          BlocProvider.of<ShoppingBloc>(context)
                                            ..add(DeleteItemFromCardEvent(
                                                cardItems: state
                                                    .cartData.shoppingItems));
                                        } else if (state
                                            is AddedItemToCardState) {
                                          state.cardItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<ShoppingBloc>(context)
                                            ..add(DeleteItemFromCardEvent(
                                                cardItems: state.cardItems));
                                        } else if (state
                                            is DeleteItemFromCardState) {
                                          state.cardItems.removeAt(index);
                                          calculateTotalAmount(cartItems);

                                          BlocProvider.of<ShoppingBloc>(context)
                                            ..add(DeleteItemFromCardEvent(
                                                cardItems: state.cardItems));
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (cartItems[index].quantity > 0)
                                        setState(() {
                                          calculateTotalAmount(cartItems);
                                          cartItems[index].quantity--;
                                        });
                                    },
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
                                        cartItems[index].quantity.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        calculateTotalAmount(cartItems);
                                        cartItems[index].quantity++;
                                      });
                                    },
                                  ),
                                  Spacer(),
                                  Text(
                                      '\$${cartItems[index].price * cartItems[index].quantity} ')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
