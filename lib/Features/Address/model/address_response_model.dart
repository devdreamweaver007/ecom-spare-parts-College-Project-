class AddressResponseModel {
  String? addressLine;

  AddressResponseModel({this.addressLine});

  AddressResponseModel.fromJson(Map<String, dynamic> json) {
    addressLine = json['address_line'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_line'] = this.addressLine;
    return data;
  }
}
