class LogisticsModel {
  String? companyName;
  String? country;
  String? address;
  String? landmark;
  String? website;
  List<VehicleTypes>? vehicleTypes;
  List<String>? goodsType;
  String? deliveriesPerMonth;
  String? howDidYouHear;
  String? referralCode;
  double? latitude;
  double? longitude;

  LogisticsModel(
      {this.companyName,
      this.country,
      this.address,
      this.landmark,
      this.website,
      this.vehicleTypes,
      this.goodsType,
      this.deliveriesPerMonth,
      this.howDidYouHear,
      this.referralCode,
      this.latitude,
      this.longitude});

  LogisticsModel.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    country = json['country'];
    address = json['address'];
    landmark = json['landmark'];
    website = json['website'];
    if (json['vehicleTypes'] != null) {
      vehicleTypes = <VehicleTypes>[];
      json['vehicleTypes'].forEach((v) {
        vehicleTypes!.add(VehicleTypes.fromJson(v));
      });
    }
    goodsType = json['goodsType'].cast<String>();
    deliveriesPerMonth = json['deliveriesPerMonth'];
    howDidYouHear = json['howDidYouHear'];
    referralCode = json['referralCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['companyName'] = companyName;
    data['country'] = country;
    data['address'] = address;
    data['landmark'] = landmark;
    data['website'] = website;
    if (vehicleTypes != null) {
      data['vehicleTypes'] = vehicleTypes!.map((v) => v.toJson()).toList();
    }
    data['goodsType'] = goodsType;
    data['deliveriesPerMonth'] = deliveriesPerMonth;
    data['howDidYouHear'] = howDidYouHear;
    data['referralCode'] = referralCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class VehicleTypes {
  String? vehicle;
  int? quantity;

  VehicleTypes({this.vehicle, this.quantity});

  VehicleTypes.fromJson(Map<String, dynamic> json) {
    vehicle = json['vehicle'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicle'] = vehicle;
    data['quantity'] = quantity;
    return data;
  }
}
