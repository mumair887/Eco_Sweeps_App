class ProductModel {
  int? status;
  Category? category;
  Category? subCategory;

  ProductModel({this.status, this.category, this.subCategory});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategory = json['sub_category'] != null
        ? new Category.fromJson(json['sub_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  List<Products>? products;

  Category({this.id, this.name, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  int? subCategoryId;
  String? name;
  String? description;
  String? amount;
  String? detail;
  String? image;
  String? showOnHome;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.name,
      this.description,
      this.amount,
      this.detail,
      this.image,
      this.showOnHome,
      this.createdAt,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    description = json['description'];
    amount = json['amount'];
    detail = json['detail'];
    image = json['image'];
    showOnHome = json['show_on_home'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['detail'] = this.detail;
    data['image'] = this.image;
    data['show_on_home'] = this.showOnHome;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
