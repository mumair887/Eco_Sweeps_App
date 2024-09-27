import 'package:flutter/material.dart';

import '../../Controller/get_address_controller.dart';
import '../../Models/get_adress.dart';

class SaveAddress extends StatefulWidget {
  const SaveAddress({super.key});

  @override
  _SaveAddressState createState() => _SaveAddressState();
}

class _SaveAddressState extends State<SaveAddress> {
  late Future<List<Address>> futureAddresses;

  @override
  void initState() {
    super.initState();
    futureAddresses = fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Address List')),
      body: FutureBuilder<List<Address>>(
        future: futureAddresses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No addresses found'));
          } else {
            List<Address> addresses = snapshot.data!;
            return ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                Address address = addresses[index];
                return ListTile(
                  title: Text(address.address),
                  subtitle: Text(
                      'House No: ${address.houseNo}, Landmark: ${address.landmark ?? "N/A"}'),
                      onTap:(){
                        Navigator.pop(context,address);
                      }
                );
              },
            );
          }
        },
      ),
    );
  }
}
