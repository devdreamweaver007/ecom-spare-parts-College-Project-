class MyOrderResponseModel {
  String? message;
  List<Orders>? orders;

  MyOrderResponseModel({this.message, this.orders});

  MyOrderResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? user;
  Part? part;
  int? quantity;
  String? totalPrice;
  String? orderedAt;
  String? currentStatus;

  Orders(
      {this.id,
      this.user,
      this.part,
      this.quantity,
      this.totalPrice,
      this.orderedAt,
      this.currentStatus});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    part = json['part'] != null ? new Part.fromJson(json['part']) : null;
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    orderedAt = json['ordered_at'];
    currentStatus = json['current_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    if (this.part != null) {
      data['part'] = this.part!.toJson();
    }
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['ordered_at'] = this.orderedAt;
    data['current_status'] = this.currentStatus;
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
  dynamic partsName;
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
