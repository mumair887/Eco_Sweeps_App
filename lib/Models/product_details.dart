import 'package:service_app/Models/product.dart';

class ProductDetailsModel {
  int? status;
  Products? data;

  ProductDetailsModel({this.status, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['Data'] != null ? Products.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}
