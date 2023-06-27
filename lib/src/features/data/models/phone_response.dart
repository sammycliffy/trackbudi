class PhoneResponse {
  User? user;
  String? token;

  PhoneResponse({this.user, this.token});

  PhoneResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? phone;
  String? countryCode;
  bool? phoneVerified;
  String? emailVerified;
  String? role;
  String? sId;
  int? iV;

  User(
      {this.phone,
      this.countryCode,
      this.phoneVerified,
      this.emailVerified,
      this.role,
      this.sId,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    countryCode = json['countryCode'];
    phoneVerified = json['phoneVerified'];
    emailVerified = json['emailVerified'];
    role = json['role'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['countryCode'] = countryCode;
    data['phoneVerified'] = phoneVerified;
    data['emailVerified'] = emailVerified;
    data['role'] = role;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}
