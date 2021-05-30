import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    this.productImage,
    this.title,
    this.price,
    this.press,
    this.addToCart,
  }) : super(key: key);
  final String productImage, title;
  final double price;
  final Function press;
  final Function addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                // boxShadow: [
                //   BoxShadow(
                //       offset: Offset(0, 30),
                //       blurRadius: 60,
                //       color: Color(0xFF393939).withOpacity(.1))
                // ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.network(
                        productImage,
                        height: 80,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      '\$ ${price}',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(15),
                      color: ThemeData().primaryColor,
                      onPressed: addToCart,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
