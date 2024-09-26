import 'dart:developer';

import 'package:flutter/material.dart';
import '../../Controller/booking_controller.dart';
import '../../Models/booking_model.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  BookingResponseModel? _booking;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch the booking data when the widget is initialized
    BookingResponseController().fetchBooking().then((booking) {
      setState(() {
        _booking = booking;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      log(error); // Handle the error here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _booking == null || _booking!.data.isEmpty
              ? const Center(child: Text('No booking found'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _booking!.data.length, // Number of bookings
                  itemBuilder: (context, index) {
                    // Accessing each booking in the list
                    var booking = _booking!.data[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Booking ID: ${booking.id}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text('User ID: ${booking.userId}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(
                              'Payment Method: ${booking.paymentMethod}',
                            ),
                            const SizedBox(height: 8),
                            Text('Total Price: \$${booking.totalPrice}'),
                            const SizedBox(height: 8),
                            Text('Tax: \$${booking.tax}'),
                            const SizedBox(height: 8),
                            Text(
                                'Delivery Address: ${booking.deliveryAddress}'),
                            const SizedBox(height: 8),
                            Text('Created At: ${booking.createdAt}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
