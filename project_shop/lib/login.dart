import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';
import 'package:project_shop/login_new.dart';
import 'package:project_shop/login_newpassword.dart';
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
  bool switch_password = true;

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/home.jpg'),fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), // ทำให้ภาพเข้มขึ้น
                        BlendMode.darken,
                      ),
                ),
                
              ),
      child:  Center(child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
        SizedBox(height: 150,),
        Text('เข้าสู่ระบบ',style: TextStyle(fontSize: 26,color: Colors.white),),
        SizedBox(height: 50,),
        
        TextField(
          controller: user_ctrl,
          onChanged: (text) =>setState(() {
            user = text;
          }),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                icon:  Icon(Icons.person_outline_rounded,color: Colors.white),
                label: Text('กรอก Username หรือ Email',style: TextStyle(color: Colors.white),),
            ),
          
        ),

        const SizedBox(height: 20,),

        TextField(
          controller: password_ctrl,
          keyboardType: TextInputType.visiblePassword,
          obscureText: switch_password,
          
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                icon:  Icon(Icons.key ,color: Colors.white,),
                label: Text('กรอกรหัสผ่าน',style: TextStyle(color: Colors.white)),
    
            ),
            onChanged: (text) => setState(() {
              Password = text;
            }),
          
        ),
        Padding(padding: EdgeInsets.only(top: 10), child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          Switch(value:switch_password ,onChanged: (isOn) => 
          setState
          (() {
            switch_password = isOn;      
            
          
          }
          )),
        
        ],),),
        
        const SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        InkWell(onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginNew(),));
        } ,child: Text('สมัครสมาชิก',style: TextStyle(color: const Color.fromARGB(255, 132, 125, 255)),),),
        
        InkWell(onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginNewpassword(),));
        } ,child: Text('ลืมรหัสผ่าน',style: TextStyle(color: const Color.fromARGB(255, 132, 125, 255)),),),
        
        
        ],),
        const SizedBox(height: 20,),
        
        // Text(user),
        // Text(Password),

        ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 50, 161, 54),
                foregroundColor: Colors.white

              ),
              onPressed: (){

                  if(user_ctrl.text != '' && password_ctrl.text != '' ){
                    if(user == Login_db.User || user == Login_db.address){
                      if( Password == Login_db.password){
                          
                          // Navigator.push(context,MaterialPageRoute(builder:(context)=>Nevigation())  );
                          main_new();
                      }else{
                        dialog(context);
                      }
                    }
                    else{
                      dialog(context);
                    }
                   }else{
                    error(context);
                   }

              }, 
              child: const Text('เข้าสู่ระบบ')),


      ],),),)
    ));
  }
  void dialog(BuildContext context)=> showDialog(
    context: context, 
    builder: (context)=>AlertDialog(
      content: const Column( 
      mainAxisSize: MainAxisSize.min,
      children: [
      Text('แจ้งเตือน \n',style: TextStyle(fontSize: 28),),
      Text('กรุณากรอกชื่อผู้ใช้หรืออีเมล์ และรหัสผ่าน ให้ถูกต้อง'),
      ]),
      actions: [
        TextButton(
          onPressed:()=> Navigator.of(context).pop(), 
          child: Text('ย้อนกลับ'))
      ]
    ));

     void error(BuildContext ctx){
    showDialog(context: ctx, builder:(context) => AlertDialog(
      content:const Column( 
      mainAxisSize: MainAxisSize.min,
      children: [
      Text('แจ้งเตือน \n',style: TextStyle(fontSize: 28),),
      Text('กรุณากรอกข้อมูลให้ครบ'),
      ]),
      actions: [TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: Text('ย้อนกลับ')) ],
    ),
    
    ); 
  }
}