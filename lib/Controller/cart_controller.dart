import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Models/addTocart.dart';
import 'package:service_app/Models/product.dart';
import 'package:service_app/Models/update_cart.dart';
import 'package:service_app/Models/view_cart.dart';
import 'package:service_app/Utils/toast_component.dart';

class CartController extends ChangeNotifier {
//
  AddToCartModel? myAddedCart;
  ViewCartModel? viewMyCart;
  UpdateCartModel? updateCart;
//

  Future<AddToCartModel?> addToCart(
      {List<Products>? addedCartProductList, int? userId}) async {
    Map postData = {
      "products": addedCartProductList,
      "user_id": userId,
    };
    try {
      var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.addCart}"),
        body: jsonEncode(postData),
      );
      log("Added Cart Data ==> ${response.body}");
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        myAddedCart = AddToCartModel.fromJson(jsonData);
        return myAddedCart;
      } else {
        ToastComponent.showDialogError("Something went wrong try again later");
        return AddToCartModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
//

  Future<ViewCartModel?> getViewMyCart(int? userId) async {
    try {
      var response = await http.get(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.getViewCart}/$userId"),
      );
      log("View Cart Data ==> ${response.body}");
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        viewMyCart = ViewCartModel.fromJson(jsonData);
        return viewMyCart;
      } else {
        ToastComponent.showDialogError("Something went wrong try again later");
        return ViewCartModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
//

  Future<UpdateCartModel?> updateCartData({int? quantity, int? cartId}) async {
    Map postData = {
      "cart_id": cartId,
      "qunatity": quantity,
    };
    try {
      var response = await http.post(
        Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.updateCart}"),
        body: postData,
      );
      log("Update Cart Data ==> ${response.body}");
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        updateCart = UpdateCartModel.fromJson(jsonData);
        return updateCart;
      } else {
        ToastComponent.showDialogError("Something went wrong try again later");
        return UpdateCartModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
//

  Future deleteCart(int cartId) async {
    var response = await http.get(
      Uri.parse("${APIREQUEST.baseUrl}${APIREQUEST.getDeleteCart}/$cartId"),
    );
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
    } else {
      ToastComponent.showDialogError("${jsonData['message']}");
    }
  }
//
}
