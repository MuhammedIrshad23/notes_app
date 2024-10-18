import 'package:flutter/material.dart';
import 'package:notes_app/services/AuthService.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Authservice authservice = Authservice();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login()async{
    print('login in clicked');
    bool response =  await authservice.login(emailController.text, passwordController.text);
    print('waiting for login response');
    if(response){
      print('login response');
      Navigator.pushNamed(context, '/posts');
    }else{
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              TextField(
                controller: emailController,
                obscureText: false,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: passwordController,
                // obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: login,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color.fromARGB(255, 140, 247, 254),
                        Color.fromARGB(255, 67, 238, 238),
                        Color.fromARGB(255, 24, 124, 133),
                        Color.fromARGB(255, 24, 216, 233),
                      ])),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
