import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String token = '';
  @override
 
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedIn();
  }

  // Future<void> isLoggedIn() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString('token')??'';
  //   if(token.isNotEmpty){
  //     Navigator.pushNamed(context, '/example');
  //   }
  // }
  Future<void> isLoggedIn() async {
    //we store the data to our local device using shared preference
    SharedPreferences pref = await SharedPreferences.getInstance();

    //we collect stored data with the pref object
    //we search for the key : token and save that value in the token variable
     token = pref.getString('token') ?? ''; //we provide a fall back value of empty string in case the token dosent exist or is empty , casue token var is non-nullable
    
    //if token is empty the condition becomes true and goes to login page
    if(token.isNotEmpty){
      Navigator.pushNamed(context, '/login');
    }else{
      //getStartedPage
    }

    // if token is empty the isloggedIn func is over and continues with the rest of the build ie the get started page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const Row(
                children: [
                  Text(
                    'Get started',
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Publish your \nPassion in Own Way \nit\'s Free.',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 33, 184, 184),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          'Register ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
