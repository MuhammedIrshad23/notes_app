import 'package:flutter/material.dart';
import 'package:notes_app/auth/login_page.dart';
import 'package:notes_app/auth/auth_contoller_page.dart';
import 'package:notes_app/auth/register_page.dart';
import 'package:notes_app/pages/Posts.dart';
import 'package:notes_app/pages/add_page.dart';
void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
        routes: {
          '/main': (context) => const MainPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/posts':(context)=> const Posts(),
          '/add':(context)=>  AddPage(),
          

        }
        
        );
  }
}
