import 'package:flutter/material.dart';

class ManageAddresses extends StatefulWidget {
  const ManageAddresses({super.key});

  @override
  State<ManageAddresses> createState() => _ManageAddressesState();
}

class _ManageAddressesState extends State<ManageAddresses> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Manage Addresses', style: TextStyle(color: Colors.black),),
      ),

      body: Column(
        children: [
          Container(
            width: width*1,
            height: height*0.001,
            color: Colors.grey.shade50,
          ),

          Container(
            width: width*1,
            height: height*0.05,
            color: Colors.white,
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.purple, size: 20,),
                SizedBox(width: width*0.02,),
                const Text('Add another address', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w700),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}