import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Constants/app_colors.dart';
import 'package:service_app/Controller/cart_controller.dart';
import 'package:service_app/Models/view_cart.dart';
import '../action_button.dart/action_button.dart';

class CustomContainer extends StatefulWidget {
  final ViewCartItems myCartItems;
  final int userId;

  const CustomContainer(
      {super.key, required this.myCartItems, required this.userId});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 10,
      shadowColor: Colors.grey.shade400,
      child: Container(
        width: width * 0.9,
        height: height * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: AppColors.lightGrey,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                widget.myCartItems.image.toString(),
                height: height * 0.8,
                width: width * 0.15,
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.myCartItems.productName.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    widget.myCartItems.totalPrice.toString(),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () async {
                    showCartDeleteDialog(context);
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            ),
            const Spacer(),
            ActionButton(
              qunatity: widget.myCartItems.quantity!,
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }

  showCartDeleteDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Delete Product'),
            content: const Text(
                'Are you sure you want to remove this product from cart?'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('Yes'),
                onPressed: () {
                  setState(() {
                    context.read<CartController>().deleteCart(context,
                        userId: widget.userId,
                        productId: widget.myCartItems.productId);
                  });

                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: const Text('No'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
