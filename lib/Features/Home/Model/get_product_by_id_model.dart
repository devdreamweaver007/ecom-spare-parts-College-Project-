class GetProductModel {
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
  String? productrating;

  GetProductModel(
      {this.id,
      this.productrating,
      this.partsCat,
      this.partImage,
      this.vBrand,
      this.vCategory,
      this.price,
      this.partsName,
      this.description,
      this.offerPrice,
      this.isOffer});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    productrating = json['product_rating'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_rating'] = this.productrating;
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
    return data;
  }
}
