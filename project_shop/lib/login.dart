import 'package:flutter/material.dart';
import 'package:project_shop/main.dart';
import 'package:project_shop/main_new.dart';
import 'package:project_shop/nevigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user = "";
    String Password = "";
    String _number = '';
    String x  = '', y='' ;
  final user_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(child: Column(children: [
        SizedBox(height: 20,),
        Text('เข้าสู่ระบบ'),
        SizedBox(height: 20,),
        
        TextField(
          controller: user_ctrl,
          onChanged: (text) =>setState(() {
            user = text;
          }),
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                icon:  Icon(Icons.person_outline_rounded),
                label: Text('Username'),
            ),
          
        ),

        const SizedBox(height: 20,),

        TextField(
          controller: password_ctrl,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                icon:  Icon(Icons.key),
                label: Text('Password'),
            ),
            onChanged: (text) => setState(() {
              Password = text;
            }),
        ),

        const SizedBox(height: 20,),
        
        // Text(user),
        // Text(Password),

        ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.purple
              ),
              onPressed: (){
                  if(user == "joknai" && Password == "111"){
                       
                       // Navigator.push(context,MaterialPageRoute(builder:(context)=>Nevigation())  );
                      main_new();
                   }
                   else{
                    
                   }

              }, 
              child: const Text('เข้าสู่ระบบ')),


      ],),),
    );
  }
  void dailog(BuildContext context)=> showDialog(
    context: context, 
    builder: (context)=>AlertDialog(
      content: Text('กรุณาใส่ user หรือ password ให้ถูกต้อง'),
      actions: [
        TextButton(
          onPressed:()=> Navigator.of(context).pop(), 
          child: Text('ย้อนกลับ'))
      ]
    ));
}