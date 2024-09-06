class ViewCartModel {
  int? status;
  List<CartItems>? cartItems;
  int? totalPrice;

  ViewCartModel({this.status, this.cartItems, this.totalPrice});

  ViewCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = totalPrice;
    return data;
  }
}

class CartItems {
  int? productId;
  String? productName;
  String? quantity;
  Null pricePerUnit;
  int? totalPrice;

  CartItems(
      {this.productId,
      this.productName,
      this.quantity,
      this.pricePerUnit,
      this.totalPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    pricePerUnit = json['price_per_unit'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['price_per_unit'] = pricePerUnit;
    data['total_price'] = totalPrice;
    return data;
  }
}
