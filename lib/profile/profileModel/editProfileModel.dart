class EditProfileModel {
  int? id;
  String? email;
  String? name;
  String? fullName;
  String? phoneNumber;
  String? addressLine;
  String? pincode;
  String? state;
  String? city;

  EditProfileModel(
      {this.id,
      this.email,
      this.name,
      this.fullName,
      this.phoneNumber,
      this.addressLine,
      this.pincode,
      this.state,
      this.city});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    addressLine = json['address_line'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['address_line'] = this.addressLine;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}
