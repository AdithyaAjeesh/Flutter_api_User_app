// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_users_api_provider_app/model/user_data.dart';
import 'package:http/http.dart' as http;

class ProviderFunctions extends ChangeNotifier {
  List<User> users = [];

  fetchMaleUsers() async {
    print('Fetching');
    const url = 'https://randomuser.me/api/?results=400&gender=male';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transform = results.map((e) {
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        image: e['picture']['thumbnail'],
      );
    }).toList();
    users = transform;
    notifyListeners();
    print(json);
  }

  fetchFemaleUsers() async {
    print('Fetching');
    const url = 'https://randomuser.me/api/?results=400&gender=female';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transform = results.map((e) {
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        image: e['picture']['thumbnail'],
      );
    }).toList();
    users = transform;
    notifyListeners();
    print(json);
  }
}
