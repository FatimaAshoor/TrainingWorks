import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = false;
  bool showRePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE AN ACCOUNT", style: TextStyle(color: MovieColors.white),),
        backgroundColor: MovieColors.black,
        iconTheme: IconThemeData(
          color: MovieColors.yellow, // Set the color of all icons in the AppBar, including the back arrow
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MovieColors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Text Form
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: TextStyle(color: MovieColors.lightGrey, fontSize: 20)),
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "you can't let the field empty";
                        }
                      },
                      style: TextStyle(color: MovieColors.white, fontSize: 20),
                      decoration: InputDecoration(
                        focusColor: MovieColors.yellow,
                      ),
                    ),
                    SizedBox(height: 50,),

                    Text("Password", style: TextStyle(color: MovieColors.lightGrey, fontSize: 20)),
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "you can't let the field empty";
                        }
                      },
                      style: TextStyle(color: MovieColors.white, fontSize: 24),
                      obscureText: showPassword? true : false,
                      decoration: InputDecoration(
                          focusColor: MovieColors.yellow,
                          suffix: showPassword? IconButton(
                            onPressed: (){
                              setState(() {
                                showPassword= false;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye, color: MovieColors.lightGrey,),
                          ) :
                          IconButton(
                            onPressed: (){
                              setState(() {
                                showPassword= true;
                              });
                            },
                            icon: Icon(Icons.code_off_rounded, color: MovieColors.lightGrey,),
                          )
                      ),
                    ),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(onTap: (){},child: Text("Forget your password?", style: TextStyle(color: MovieColors.white, fontSize: 20))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),

              MaterialButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    Navigator.of(context).pushNamed("home");
                  }
                },
                color: MovieColors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minWidth: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: MovieColors.black,
                    fontSize: 20, //
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 60,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up With Social media", style: TextStyle(color: MovieColors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      /*Container(
                          decoration: BoxDecoration(
                            color: MovieColors.white,
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Image.asset("twitter.png", height: 28, width: 28,),
                        ),*/
                    ],
                  )
                ],
              ),
              SizedBox(height: 60,),

              Row(
                children: [
                  Text("Not a member? ", style: TextStyle(color: MovieColors.white, fontSize: 20)),
                  InkWell(onTap: (){}, child: Text("Sign Up", style: TextStyle(color: MovieColors.yellow, fontSize: 20)),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
