import 'dart:convert';
import 'dart:developer';

import 'package:trackbudi_vendor/src/features/data/models/phone_response.dart';

import '../../../config/keys/app_keys.dart';
import '../../../config/locator/app_locator.dart';
import '../../../config/services/api/api_client.dart';
import '../../../config/services/endpoints.dart';
import '../../../config/services/storage_service.dart';

class AuthRepo {
  final _storage = locator<LocalStorageService>();

  Future<bool> login(
    String countryCode,
    String phoneNumber,
  ) async {
    var body = {'countryCode': countryCode, 'phone': phoneNumber};
    final response =
        await ApiClient.post(Endpoints.login, body: body, useToken: false);

    if (response.status == 'success') {
      _storage.saveDataToDisk(AppKeys.user, json.encode(response.data));
      _storage.saveDataToDisk(
          AppKeys.token, json.encode(response.data['token']));
      return true;
    }
    return false;
  }

  Future<bool> phoneNumberRegister(
    String countryCode,
    String phoneNumber,
  ) async {
    var body = {'countryCode': countryCode, 'phone': phoneNumber};
    final response =
        await ApiClient.post(Endpoints.register, body: body, useToken: false);

    if (response.status == 'success') {
      _storage.saveDataToDisk(AppKeys.user, json.encode(response.data));
      _storage.saveDataToDisk(
          AppKeys.token, json.encode(response.data['token']));
      return true;
    }
    return false;
  }

  Future<bool> registerLogistics() async {
    var body = {"userType": "LogisticsPartner"};

    final response =
        await ApiClient.post(Endpoints.userTypes, body: body, useToken: true);

    if (response.statusCode == "success") {
      return true;
    }
    return false;
  }

  Future<bool> registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    var body = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
    PhoneResponse phoneResponse = PhoneResponse.fromJson(
        json.decode(_storage.getDataFromDisk(AppKeys.user)));
    log(_storage.getDataFromDisk(AppKeys.token));
    String url = "${Endpoints.userUpdate}/${phoneResponse.user!.sId}";
    log(url);
    final response = await ApiClient.put(url, body: body, useToken: true);

    if (response.status == 'success') {
      return true;
    }

    return false;
  }

  Future<bool> registerVendor() async {
    var body = {"userType": "Vendor/SMB"};

    final response =
        await ApiClient.post(Endpoints.userTypes, body: body, useToken: true);

    if (response.statusCode == "success") {
      return true;
    }
    return false;
  }

  Future<bool> resendOTP() async {
    PhoneResponse phoneResponse = PhoneResponse.fromJson(
        json.decode(_storage.getDataFromDisk(AppKeys.user)));
    log(_storage.getDataFromDisk(AppKeys.token));
    String url = "${Endpoints.user}${phoneResponse.user!.sId}/resend-otp";
    final response = await ApiClient.post(url, body: null, useToken: true);

    if (response.status == 'success') {
      return true;
    }
    return false;
  }

  Future<bool> verifySmsOTP(String otp) async {
    var body = {'otp': otp};
    PhoneResponse phoneResponse = PhoneResponse.fromJson(
        json.decode(_storage.getDataFromDisk(AppKeys.user)));
    log(_storage.getDataFromDisk(AppKeys.token));
    String url = "${Endpoints.user}${phoneResponse.user!.sId}/verify-otp";
    log(url);
    final response = await ApiClient.post(url, body: body, useToken: true);

    if (response.status == 'success') {
      return true;
    }

    return false;
  }
}
