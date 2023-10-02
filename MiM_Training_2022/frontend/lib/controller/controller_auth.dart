import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
var ali = 2;
  var isLoading = false.obs;
  var dataloading = false.obs;
  var signupLoading = false.obs;
  var updateLoding = false.obs;
  var deleteLoding = false.obs;
  var logindata = {}.obs;
  var signupdata = {}.obs;
  var emaildata = {}.obs;
  var updatadata = {}.obs;
  var deletedata = {}.obs;
  var _baseUrl = "http://192.168.15.110:5000/";

  @override
  Future<dynamic> login(body) async {
    try {
      print("${body}");
      isLoading(true);
      update();
      HttpClient httpClient =  HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(_baseUrl + "login"));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(body));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      String user = await response.transform(utf8.decoder).join();
      var reply = jsonDecode(user);

      logindata(reply);
      print("hello this is the obs from the auth ${logindata['firstname']}");
      //print("here is data ${response.statusCode} jjii nn ${reply['success']}");
      httpClient.close();
      isLoading(false);
      update();
      return reply;
    } catch (e) {
      print("this is the error of login catch e ${e}");
      isLoading(false);
      update();
    }
  }

  Future<dynamic> signup(body) async {
    try {
      print("signup body ${body}");
      signupLoading(true);
      update();
      HttpClient httpClient =  HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(_baseUrl + "register"));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(body));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      String user = await response.transform(utf8.decoder).join();
      var reply = jsonDecode(user);
      signupdata(reply);
      print("hello this is the obs from the signup ${signupdata}");
      //print("here is data ${response.statusCode} jjii nn ${reply['success']}");
      httpClient.close();
      signupLoading(false);
      update();
      return reply;
    } catch (e) {
      print("this is the error of catch e ${e}");
      signupLoading(false);
      update();
    }
  }

  Future<dynamic> getdata(body)async{
    try {
      print("${body}");
      dataloading(true);
      update();
      print("1");
      HttpClient httpClient =  HttpClient();
      print("2");
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(_baseUrl + "register/email"));
      print("3");
      request.headers.set('content-type', 'application/json');
      print("4");
      request.add(utf8.encode(body));
      print("5 ${request}");
      HttpClientResponse response = await request.close();
      print("6 ${response.statusCode}");
      // todo - you should check the response.statusCode
      String user = await response.transform(utf8.decoder).join();
      print("7    ");
      var reply = jsonDecode(user);
      print("8  ${reply['data']}");
      emaildata(reply);
      print("hello this is the obs from the getdata ${emaildata['data']['val']}");
      //print("here is data ${response.statusCode} jjii nn ${reply['success']}");
      httpClient.close();
      dataloading(false);
      update();
      return reply;
    } catch (e) {
      print("this is the error of getdata catch ${e}");
      dataloading(false);
      update();
    }
  }

Future<dynamic> deleteUser(body) async {
  try {
    print("${body}");
    deleteLoding(true);
    update();
    HttpClient httpClient =  HttpClient();
    print("3");
    HttpClientRequest request = await httpClient.deleteUrl(Uri.parse(_baseUrl + "delete"));
    print("4");
    request.headers.set('content-type', 'application/json');
    String? token = logindata['token'];
    print("token token token ${token}");
    request.headers.set('x-access-token', token!);
    print("5");
    request.add(utf8.encode(body));
    print("6");
    HttpClientResponse response = await request.close();
    print("7 ${response.statusCode}");
    // todo - you should check the response.statusCode
    String user = await response.transform(utf8.decoder).join();
    print("8${user}");
    var reply = jsonDecode(user);
    print("8");
    deletedata(reply);
    print("hello this is the obs from the auth ${deletedata}");
    //print("here is data ${response.statusCode} jjii nn ${reply['success']}");
    httpClient.close();
    deleteLoding(false);
    update();
    return reply;
  } catch (e) {
    print("this is the error of catch e ${e}");
    deleteLoding(false);
    update();
  }
}

  Future<dynamic> updateProfile(body)async{
    try {
      print("${body}");
      updateLoding(true);
      update();
      HttpClient httpClient =  HttpClient();
      HttpClientRequest request = await httpClient.putUrl(Uri.parse(_baseUrl + "register/update"));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(body));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      String user = await response.transform(utf8.decoder).join();
      var reply = jsonDecode(user);
      updatadata(reply);
      print("hello this is the obs from the updata Data ${updatadata}");
      //print("here is data ${response.statusCode} jjii nn ${reply['success']}");
      httpClient.close();
      updateLoding(false);
      update();
      return reply;
    } catch (e) {
      print("this is the error of catch e ${e}");
      updateLoding(false);
      update();
    }
  }

}

