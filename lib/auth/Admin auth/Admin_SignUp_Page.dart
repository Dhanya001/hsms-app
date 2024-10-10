import 'package:flutter/material.dart';
import 'package:hsms/auth/Admin%20auth/Admin_login.dart';

class AdminSignupPage extends StatefulWidget {
  const AdminSignupPage({super.key});

  @override
  State<AdminSignupPage> createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage> {
  //we neet Three text editing controller

  final username=TextEditingController();
  final password=TextEditingController();
  final confirmPassword=TextEditingController();

  //we need a bool variable to hide password
  bool isVisible = false;

  //we have create global key for our form
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text("Register New Admin",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  ),

                  //Username Field
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurpleAccent.withOpacity(.3)
                    ),
                    child: TextFormField(
                      controller: username,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username is required.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Username",
                      ),
                    ),
                  ),

                  //Password Field
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurpleAccent.withOpacity(.3)
                    ),
                    child: TextFormField(
                      controller: password,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password is required.";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(onPressed: () {
                          //In here password show and hide a toggle button
                          setState(() {
                            //toggle button
                            isVisible=!isVisible;

                          });

                        }, icon: Icon(isVisible? Icons.visibility : Icons.visibility_off)),
                      ),
                    ),
                  ),

                  //Confirm password Field
                  //now we check password matched or not matched.
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurpleAccent.withOpacity(.3)
                    ),
                    child: TextFormField(
                      controller: confirmPassword,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Confirm Password is required.";
                        }else if(password.text!=confirmPassword.text){
                          return "Password Doesn't Matched.";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Re-Enter Password",
                        suffixIcon: IconButton(onPressed: () {
                          //In here password show and hide a toggle button
                          setState(() {
                            //toggle button
                            isVisible=!isVisible;

                          });

                        }, icon: Icon(isVisible? Icons.visibility : Icons.visibility_off)),
                      ),
                    ),
                  ),

                  //Login Button
                  const SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple
                    ),
                    child: TextButton(onPressed: () {
                      if(formkey.currentState!.validate()){
                        //Login method here

                      }

                    }, child: const Text("SIGN UP",style: TextStyle(color: Colors.white),)),
                  ),

                  //sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: () {
                        //Navigator to New Admin Login
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminLoginPage()));
                      }, child: const Text("LOGIN"))
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
