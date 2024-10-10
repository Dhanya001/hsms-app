import 'package:flutter/material.dart';
import 'package:hsms/screens/Home_screen/home_page.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //UserProvider userProvider;
    Future<User?> _googleSignUp() async {
      try {
        final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: ['email'],
        );
        final FirebaseAuth _auth = FirebaseAuth.instance;

        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        final User? user = (await _auth.signInWithCredential(credential)).user;
        // print("signed in " + user.displayName);

        return user;
      } catch (e) {
      }
    }
  @override
  Widget build(BuildContext context) {
//userProvider = Provider.of<UserProvider>(context);
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(

          image: DecorationImage(

              fit: BoxFit.cover,
              image: AssetImage('assets/signin_background2.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 400,
                width: 280,
                color: Colors.white24,
                child: Column(
                  children: [
                    Text('Sign To Continue',style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'HSMS',
                        style: TextStyle(
                          fontSize: 60,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                            shadows: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.green.shade900,
                                offset: Offset(5, 5),
                              )
                            ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SignInButton(
                        Buttons.apple,
                            onPressed: () {
                              _googleSignUp().then((value) => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              ),
                              );
                            }),
                        SignInButton(
                            Buttons.google,
                            onPressed: () {
                              _googleSignUp().then((value) => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                  ),
                              ),
                              );

                            }),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text('By sigining in you are agreeing to our' ,style: TextStyle(color: Colors.black),),
                          Text('Terms and Privcacy Policy',style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}