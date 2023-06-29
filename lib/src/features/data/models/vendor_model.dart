class PickupAddresses {
  String? address;
  String? landmark;
  double? latitude;
  double? longitude;

  PickupAddresses({this.address, this.landmark, this.latitude, this.longitude});

  PickupAddresses.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    landmark = json['landmark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['landmark'] = landmark;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class VendorModel {
  String? businessName;
  String? country;
  List<String>? goodsType;
  String? userType;
  List<PickupAddresses>? pickupAddresses;

  VendorModel(
      {this.businessName,
      this.country,
      this.goodsType,
      this.userType,
      this.pickupAddresses});

  VendorModel.fromJson(Map<String, dynamic> json) {
    businessName = json['businessName'];
    country = json['country'];
    goodsType = json['goodsType'].cast<String>();
    userType = json['userType'];
    if (json['pickupAddresses'] != null) {
      pickupAddresses = <PickupAddresses>[];
      json['pickupAddresses'].forEach((v) {
        pickupAddresses!.add(PickupAddresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['businessName'] = businessName;
    data['country'] = country;
    data['goodsType'] = goodsType;
    data['userType'] = userType;
    if (pickupAddresses != null) {
      data['pickupAddresses'] =
          pickupAddresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
