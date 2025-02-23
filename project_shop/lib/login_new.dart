import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';

class LoginNew extends StatefulWidget {
  const LoginNew({super.key});

  @override
  State<LoginNew> createState() => _LoginNewState();
}

class _LoginNewState extends State<LoginNew> {
  var user = TextEditingController();
  var password = TextEditingController();
  var password2 = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  bool switch_password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/home.jpg'),fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), // ทำให้ภาพเข้มขึ้น
                        BlendMode.darken,
                      ),
                ),
                
              ),
      child:  
      SingleChildScrollView(scrollDirection: Axis.vertical,child: 
       Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
          SizedBox(height: 150,),
          Text('สมัครสมาชิก',style: TextStyle(color: Colors.white,fontSize: 30),),
          SizedBox(height: 50,),
          TextField(
          controller: user,
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
              label: Text('ชื่อผู้ใช้',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),
          const SizedBox(height: 20,),
          TextField(
          controller: address,
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
                label: Text('ที่อยู่',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),

          const SizedBox(height: 20,),
          TextField(
          controller: phone,
          keyboardType: TextInputType.numberWithOptions(),
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
                label: Text('เบอร์โทร',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),
          const SizedBox(height: 20,),
          TextField(
          controller: email,
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
                label: Text('อีเมล์',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),
          const SizedBox(height: 20,),
          TextField(
          controller: password,
          keyboardType: TextInputType.visiblePassword,
          obscureText: switch_password,
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
                label: Text('กรอกรหัสผ่าน',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),
          const SizedBox(height: 20,),
          TextField(
          controller: password2,
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.visiblePassword,
            obscureText: switch_password,
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
                label: Text('กรอกรหัสผ่านอีกครั้ง',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
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
          ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('ย้อนกลับ', style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
          
          ElevatedButton(

              onPressed: () { 
              if(user.text != ''  && address.text != '' && phone.text != '' && email.text != '' && password.text != '' && password2.text != ''){
                
                if(password.text == password2.text){

                Login_db.User = user.text.toString();
                Login_db.address = address.text.toString();
                Login_db.phone = phone.text.toString();
                Login_db.password = password.text.toString();
                Login_db.email = email.text.toString();

                Navigator.of(context).pop();
                }
                else{
                  Show(context);
                }
              }else{

                error(context);
              }
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('ยืนยัน', style: TextStyle(color: Colors.white)),
          
            ),
            
            ],),


            SizedBox(height: 200,),

          ]
          ),
        
        ),),
      )
    );
  }

  void Show(BuildContext ctx){
   showDialog(context: ctx, builder:(context) => AlertDialog(
    content:const Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('แจ้งเตือน \n',style: TextStyle(fontSize: 28),),
    Text('กรุณากรอกรหัสผ่านให้ตรงกัน'),
    ]),
    actions: [TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: Text('ย้อนกลับ')) ],
  ),
  
  ); 
}

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