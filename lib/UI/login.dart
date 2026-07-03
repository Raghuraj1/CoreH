import 'package:coreh/UI/Splash.dart';
import 'package:coreh/service/auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _login();

}

class _login extends State<login>{
  var email = TextEditingController();
  var pass = TextEditingController();

  void Singin() async{
    await authService.value.signIn(
        email: email.text, password: pass.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => splashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 600,
          child: Card(
            color: Colors.blue.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login", style: TextStyle(fontSize: 30),),
                SizedBox(height: 20,),
                Text("Email",style: TextStyle(fontSize: 20),),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    suffixText: "Email id",
                  ),
                  controller: email,
                ),
                SizedBox(height: 20,),
                Text("Password",style: TextStyle(fontSize: 20),),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      suffixText: "Password",
                  ),
                  controller: pass,
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  String uemail = email.text.toString();
                  String upass = pass.text.toString();
                  print("Email : $uemail \nPass : $upass");
                  Singin();
                },
                    child: Text("Submit"),)
              ],
            ),
          ),

        ),
      ),
    );
  }

}