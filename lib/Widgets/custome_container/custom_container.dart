import 'package:flutter/material.dart';
import '../action_button.dart/action_button.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  const CustomContainer({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 2,
      shadowColor: Colors.grey.shade400,
      child: Container(
        width: width * 0.9,
        height: height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                image,
                height: height * 0.8,
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  )
                ],
              ),
            ),
            const ActionButton(),
          ],
        ),
      ),
    );
  }
}
