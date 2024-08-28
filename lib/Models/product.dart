import 'package:service_app/Models/category.dart';
import 'package:service_app/Models/sub_category.dart';

class ProductResponse {
  int? status;
  List<ProductModel>? data;

  ProductResponse({this.status,  this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'],
      data: List<ProductModel>.from(
          json['Data'].map((x) => ProductModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'Data': List<dynamic>.from(data!.map((x) => x.toJson())),
    };
  }
}

class ProductModel {
  int? id;
  int? categoryId;
  int? subCategoryId;
  String? name;
  String? description;
  String? amount;
  String? detail;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel? category;
  SubCategoryModel? subCategory;

  ProductModel({
     this.id,
     this.categoryId,
     this.subCategoryId,
     this.name,
     this.description,
     this.amount,
     this.detail,
     this.image,
     this.createdAt,
     this.updatedAt,
     this.category,
     this.subCategory,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      name: json['name'],
      description: json['description'],
      amount: json['amount'],
      detail: json['detail'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      category: CategoryModel.fromJson(json['category']),
      subCategory: SubCategoryModel.fromJson(json['sub_category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'name': name,
      'description': description,
      'amount': amount,
      'detail': detail,
      'image': image,
      'created_at': createdAt!.toIso8601String(),
      'updated_at': updatedAt!.toIso8601String(),
      'category': category,
      'sub_category': subCategory,
    };
  }
}
