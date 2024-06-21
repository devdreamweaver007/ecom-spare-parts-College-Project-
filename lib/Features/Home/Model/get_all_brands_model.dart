class GetAllBrandsLogo {
  int? id;
  String? vehicleBrand;
  bool? isCar;
  String? brandLogo;
  int? vehicleCategory;

  GetAllBrandsLogo(
      {this.id,
      this.vehicleBrand,
      this.isCar,
      this.brandLogo,
      this.vehicleCategory});

  GetAllBrandsLogo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleBrand = json['vehicle_Brand'];
    isCar = json['is_car'];
    brandLogo = json['Brand_logo'];
    vehicleCategory = json['vehicle_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicle_Brand'] = this.vehicleBrand;
    data['is_car'] = this.isCar;
    data['Brand_logo'] = this.brandLogo;
    data['vehicle_category'] = this.vehicleCategory;
    return data;
  }
}
