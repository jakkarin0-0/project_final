import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';

class LoginNewpassword extends StatefulWidget {
  const LoginNewpassword({super.key});

  @override
  State<LoginNewpassword> createState() => _LoginNewpasswordState();
}

class _LoginNewpasswordState extends State<LoginNewpassword> {
  var user = TextEditingController();
  var password = TextEditingController();
  var password2 = TextEditingController();
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
      child: Padding(padding: EdgeInsets.all(20) ,child: Column(children: [
        SizedBox(height: 150,),
        Text('สร้างรหัสผ่านใหม่',style: TextStyle(color: Colors.white ,fontSize:30 ),),
        SizedBox(height: 50,),
        
        TextField(
          controller: user,
            style: const TextStyle(color: Colors.white),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
              label: Text('กรอกชื่อผู้ใช้หรืออีเมล์เดิม',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),

        SizedBox(height: 20,),
        
        TextField(
          controller: password,
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.visiblePassword,
          obscureText: switch_password,
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
              label: Text('กรอกรหัสผ่านใหม่',style: TextStyle(color: Colors.white),),
            ),
            onChanged: (text) => setState(() {
            
            }),
          ),

          SizedBox(height: 20,),
        
        TextField(
          controller: password2,
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.visiblePassword,
          obscureText: switch_password,
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),),
              label: Text('กรอกรหัสผ่านใหม่อีกครั้ง',style: TextStyle(color: Colors.white),),
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

          SizedBox(height: 20,),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
          ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('ย้อนกลับ', style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
          
          ElevatedButton(

              onPressed: () { 
              if(user.text != ''  && password.text != '' && password2.text != ''){

                if(user.text == Login_db.User || user.text == Login_db.email){
                
                  if(password.text == password2.text){
                    Login_db.password = password.text.toString();
                    Navigator.of(context).pop();

                  }
                  else{
                    Show(context);
                  }
                }
                else{
                  erroruser(context);
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








      ],),) 
      
      ),
    );
  }

    void Show(BuildContext ctx){
    showDialog(context: ctx, builder:(context) => AlertDialog(
      content:Column( 
      mainAxisSize: MainAxisSize.min,
      children: [
      Text('แจ้งเตือน \n\n',style: TextStyle(fontSize: 28),),
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

  void erroruser(BuildContext ctx){
    showDialog(context: ctx, builder:(context) => AlertDialog(
      content:const Column( 
      mainAxisSize: MainAxisSize.min,
      children: [
      Text('แจ้งเตือน \n',style: TextStyle(fontSize: 28),),
      Text('ชื่อผู้ใช้ หรือ อีเมล์ ไม่ถูกต้อง'),
      ]),
      actions: [TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: Text('ย้อนกลับ')) ],
    ),
    
    ); 
  }

}