// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_order_app/provider/my_provider.dart';
import 'package:food_order_app/screen/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required VoidCallback onTap,
    required int quantity,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 170,
          height: 170,
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "burger bhout acha hain",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "$quantity",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: onTap,
            ),
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalPrice();
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "\$ $total",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              "Check Out",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),

      // body: Column(
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(
      //           child: SizedBox(
      //             height: 170,
      //             width: 170,
      //             // color: Colors.white,
      //             child: CircleAvatar(
      //               backgroundImage: AssetImage('images/1.png'),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Stack(
      //             alignment: Alignment.topRight,
      //             children: [
      //               SizedBox(
      //                 height: 190,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   // ignore: prefer_const_literals_to_create_immutables
      //                   children: [
      //                     Text(
      //                       "Burger",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 30,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text(
      //                       "Burger is awesome...",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                     Text(
      //                       "\$23",
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 20,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Row(
      //                       children: [
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: Icon(
      //                             Icons.remove_circle_outline,
      //                             color: Colors.white,
      //                             size: 30,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           width: 12,
      //                         ),
      //                         Text(
      //                           "1",
      //                           style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 20,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           width: 6,
      //                         ),
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: Icon(
      //                             Icons.add_circle_outline,
      //                             color: Colors.white,
      //                             size: 30,
      //                           ),
      //                         ),
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               IconButton(
      //                 onPressed: () {},
      //                 icon: Icon(
      //                   Icons.close,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return cartItem(
            onTap: (){
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}
