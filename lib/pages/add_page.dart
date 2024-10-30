import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../auth/konstant.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  String token='';
  
  void addPost(BuildContext context) async {
    Map postData = {
      'title' : titleController.text,
      'body' : bodyController.text,
    };

    var response = await http.post(
       Uri.parse('https://api.vrindtime.com/public/api/posts'),
      headers: {
        'Content-type':'Application/json',
        'Accept': 'application/json',
        'Authorization':'Bearer $token'
      },
      body: jsonEncode(postData),
      
    );
    print(response.body);
    print('${base_url}public/api/posts');
    var data = jsonDecode(response.body);
    var isSuccess = data['success']??false;
    if (isSuccess){
      debugPrint('Post added successfuly');
      debugPrint(token);
      Navigator.pop(context,true);

    }
    else {
      debugPrint('Failed to add post');
      debugPrint(response.body);
      debugPrint('Token for current user:$token');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 216, 237),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reminders',
                        style: GoogleFonts.arima(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.person,
                        size: 25,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText:'Title',border: OutlineInputBorder()
                  ),
                )   
                ],
              ))),
    );
  }
}
