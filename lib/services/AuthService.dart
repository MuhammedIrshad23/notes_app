import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  String token='';
  String messsage = '';
  Future<bool> register(String name, String email, String password,
      String confirmPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map sendData = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    await dotenv.load(fileName: ".env");
    String url = dotenv.env['base_url'] ?? '';
    var response = await http.post(
      Uri.parse('${url}api/register'),
      headers: {
        'Content-type': 'Application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(sendData),
    );
    if (response.statusCode == 200) {
      var getData = jsonDecode(response.body);
      token = getData['token'];
      if (token.isNotEmpty && getData['message'] == 'success') {
        prefs.setString('token', token);
        prefs.setInt('id', getData['id']);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    print('started login process');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await dotenv.load(fileName: ".env");
    String url = dotenv.env['base_url'] ?? '';
    var response;
    
    try{
      response = await http.post(Uri.parse('${url}api/login'),
        headers: {
          'Content-type': 'Application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    }catch(e){
      print('failed login\nError:$e');
    }

    print(url);
    if (response.statusCode == 200) {
      print('success login');
      var data = jsonDecode(response.body);

      int id = data['id'];
      token = data['token'];
      messsage = data['message'];
      if (token.isNotEmpty && messsage == 'success') {
        await prefs.setInt('id', id);
        await prefs.setString('token', token);
        return true;
      } else {
        print(data);
        print('failed login');
        return false;
      }
    }else{
      print('Error: Status code: ${response.statusCode}');
    }
    return false;
  }
}
