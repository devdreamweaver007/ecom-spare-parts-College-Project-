class SearchproductResponseModel {
  List<Results>? results;

  SearchproductResponseModel({this.results});

  SearchproductResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
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

  Results(
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

  Results.fromJson(Map<String, dynamic> json) {
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
