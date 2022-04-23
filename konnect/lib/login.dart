
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const routeName = '/Login';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.height;
   return Scaffold(
     body: SingleChildScrollView(
       child : Column(
         children: <Widget>[
           Container(
             width: width,
             height: height,
             padding: const EdgeInsets.all(16.0),
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 colors: [Colors.indigoAccent, Colors.deepPurple],
               ),
             ),
             child: Column(
               children: <Widget>[
                 Container(
                   margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                    height: 80,
                   ),
                   const Text(
                     "Konnect",
                     style: TextStyle(
                       color: Colors.white70,
                       fontSize: 24.0,
                       fontWeight: FontWeight.bold),
                     ),
                    const SizedBox(height: 40.0),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIcon: Container(
                          padding: const EdgeInsets.only(top:16.0, bottom: 16.0),
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(10.0)
                            )
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.lightBlue,
                          )
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        ),
                   ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(1.0)
                          )
                        ),
                        child: const Icon(
                          Icons.lock,
                          color: Colors.lightBlue,
                        )
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                    obscureText: true,
                 ),
                 const SizedBox(height: 30.0),
                 SizedBox(
                   width: double.infinity,
                   child: RaisedButton(
                     color: Colors.white,
                     textColor: Colors.lightBlue,
                     padding: const EdgeInsets.all(20.0),
                     child: Text("Login". toUpperCase()),
                     onPressed: () {  },
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30.0)),
                     ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         FlatButton(
                           textColor: Colors.white70,
                           child: Text("EOS Solar".toUpperCase()),
                           onPressed: () {},
                         ),
                         Container(
                           color: Colors.white54,
                           width: 2.0,
                           height: 20.0,
                         ),
                         FlatButton(
                           textColor: Colors.white70,
                           child: Text("Malingi@2022".toUpperCase()),
                           onPressed: () {},
                         ),
                       ],
                     ),
                   ],
                 ),
             ),
         ],
       ),
     ),
   );
  }
}