class CartResponseModel {
  String? message;
  List<CartItems>? cartItems;
  dynamic totalCartPrice;

  CartResponseModel({this.message, this.cartItems, this.totalCartPrice});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    totalCartPrice = json['total_cart_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['total_cart_price'] = this.totalCartPrice;
    return data;
  }
}

class CartItems {
  int? id;
  User? user;
  Part? part;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  CartItems(
      {this.id,
      this.user,
      this.part,
      this.quantity,
      this.createdAt,
      this.updatedAt});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    part = json['part'] != null ? new Part.fromJson(json['part']) : null;
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.part != null) {
      data['part'] = this.part!.toJson();
    }
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  String? name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Part {
  int? id;
  int? partsCat;
  String? partImage;
  int? vBrand;
  int? vCategory;
  String? price;
  String? partsName;
  String? description;
  dynamic offerPrice;
  bool? isOffer;
  String? productRating;

  Part(
      {this.id,
      this.partsCat,
      this.partImage,
      this.vBrand,
      this.vCategory,
      this.price,
      this.partsName,
      this.description,
      this.offerPrice,
      this.isOffer,
      this.productRating});

  Part.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partsCat = json['parts_Cat'];
    partImage = json['part_image'];
    vBrand = json['v_brand'];
    vCategory = json['v_category'];
    price = json['price'];
    partsName = json['parts_name'];
    description = json['description'];
    offerPrice = json['offer_price'];
    isOffer = json['is_offer'];
    productRating = json['product_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parts_Cat'] = this.partsCat;
    data['part_image'] = this.partImage;
    data['v_brand'] = this.vBrand;
    data['v_category'] = this.vCategory;
    data['price'] = this.price;
    data['parts_name'] = this.partsName;
    data['description'] = this.description;
    data['offer_price'] = this.offerPrice;
    data['is_offer'] = this.isOffer;
    data['product_rating'] = this.productRating;
    return data;
  }
}
