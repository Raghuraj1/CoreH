import 'package:coreh/UI/Splash.dart';
import 'package:coreh/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:coreh/UI/Dashboard_A.dart';
import 'package:coreh/UI/Dashboard_M.dart';
import 'package:coreh/UI/Dashboard_W.dart';
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _login();

}

class _login extends State<login> {

  final _dbservice = DatabaseService();
  var email = TextEditingController();
  var pass = TextEditingController();
  static const name = "Raghu";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffA8EDEA),Color(0xffFED6E3)
            ])
          ),
      ),
          Center(
            child: Container(
              height: 600,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login", style: TextStyle(fontSize: 30),),
                  SizedBox(height: 20,),
                  Text("E Code",style: TextStyle(fontSize: 20),),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("E-Code"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Employee Code",
                    ),
                    controller: email,
                  ),
                  SizedBox(height: 20,),
                  Text("Password",style: TextStyle(fontSize: 20),),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Password",
                    ),
                    controller: pass,
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: () async {

                    String uemail = email.text.toString();
                    int ecode = int.tryParse(uemail) ?? 0;
                    if (ecode >= 10300 || ecode < 10001){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
                    }
                    String upass = pass.text.toString();
                    print("Email : $uemail \nPass : $upass");
                    final user = User(ecode: email.text, epass: pass.text);
                    final Udata = await _dbservice.Read(user);

                    if (Udata["password"] == user.epass){
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString("name", Udata['name']);
                      prefs.setString("department", Udata['department']);
                      prefs.setString("password", Udata['password']);
                      prefs.setString("shift", Udata['shift']);
                      prefs.setString("shift_start_date", Udata['shift_start_date']);
                      prefs.setString("working_area_code", Udata['working_area_code']);
                      prefs.setBool("isIn", true);
                      if (Udata["department"] == "Maintenance"){
                        Navigator.push(context,MaterialPageRoute(builder: ((context) => Mdash())));
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => Wdash())));
                      }
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                    }

                  },
                      child: Text("Submit"),)
                ],
              ),
            ),
          )
      ],
        ),

    );
  }

}


class User{
  final String ecode;
  final String epass;

  User({required this.ecode, required this.epass});
}