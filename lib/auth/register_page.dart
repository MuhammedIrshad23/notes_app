import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/services/AuthService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isObscure = false;
  Authservice authservice = Authservice();

  void register() async{
    bool response = await authservice.register(nameController.text, emailController.text,
        passwordController.text, confirmPasswordController.text);
    if(response){
      Navigator.pushNamed(context, '/example');
    }else{
      print('Error');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Register.',
                    style: GoogleFonts.updock(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 32, 155, 177)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 32, 193, 211),
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 32, 193, 211),
                          ))),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock,
                              color: Color.fromARGB(255, 32, 193, 211)),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ))),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'ConfirmPassword',
                        prefixIcon: const Icon(Icons.lock,
                            color: Color.fromARGB(255, 32, 193, 211)),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: register,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 140, 247, 254),
                                Color.fromARGB(255, 67, 238, 238),
                                Color.fromARGB(255, 24, 124, 133),
                                Color.fromARGB(255, 24, 216, 233),
                              ])),
                      child: Center(
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 250, 250, 250)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
