import 'package:service_app/Models/addTocart.dart';

class ViewCartModel {
  int? _status;
  List<CartItems>? _cartItems;
  int? _totalPrice;

  ViewCartModel({int? status, List<CartItems>? cartItems, int? totalPrice}) {
    if (status != null) {
      _status = status;
    }
    if (cartItems != null) {
      _cartItems = cartItems;
    }
    if (totalPrice != null) {
      _totalPrice = totalPrice;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  List<CartItems>? get cartItems => _cartItems;
  set cartItems(List<CartItems>? cartItems) => _cartItems = cartItems;
  int? get totalPrice => _totalPrice;
  set totalPrice(int? totalPrice) => _totalPrice = totalPrice;

  ViewCartModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['cart_items'] != null) {
      _cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        _cartItems!.add(CartItems.fromJson(v));
      });
    }
    _totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = _status;
    if (_cartItems != null) {
      data['cart_items'] = _cartItems!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = _totalPrice;
    return data;
  }
}
