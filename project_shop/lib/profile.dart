import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';
import 'package:project_shop/main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var new_address = TextEditingController();
  var new_phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      appBar: AppBar(title:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text('ข้อมูลผู้ใช้') , IconButton(onPressed: (){main();}, icon:Icon( Icons.power_settings_new_sharp))]),backgroundColor: Color.fromARGB(255, 195, 151, 50),),
      body:   SingleChildScrollView(scrollDirection: Axis.vertical,child:  Padding(padding: EdgeInsets.all(20),child:  Column(
        children: [
          const SizedBox(height: 20,),
          Container( alignment: Alignment.center, padding: EdgeInsets.all(20), child: Icon(Icons.person_outline_sharp,size: 50,) ,decoration: BoxDecoration(shape: BoxShape.circle,color:Color.fromARGB(255, 195, 151, 50) ) ,),
          const SizedBox(height: 20,),

          Column(mainAxisAlignment: MainAxisAlignment.center ,children: [
          Text('ชื่อผู้ใช้ : ${Login_db.User}',style: TextStyle(fontSize: 26),),
          const SizedBox(height: 20,),
          Text('เบอร์โทร : ${Login_db.phone}'),
           const SizedBox(height: 5,),
          InkWell(onTap:(){Show2(context);} ,child:Text('(แก้ไขเบอรโทร)',style: TextStyle(color: const Color.fromARGB(255, 7, 26, 131)),) ,),
          const SizedBox(height: 20,),
          SingleChildScrollView(scrollDirection: Axis.horizontal,child: 
          Text('ที่อยู่ : ${Login_db.address}'),),],),
          const SizedBox(height: 5,),
          InkWell(onTap:(){Show1(context);} ,child:Text('(แก้ไขที่อยู่)',style: TextStyle(color: const Color.fromARGB(255, 7, 26, 131)),) ,),
          Column(children: [
          Container(
            
            width: 500,height: 400,
              //color: Colors.amber,
            child:  
            ListView(
              padding: EdgeInsets.all(20),
              children: buildListview(), 
            ),
          ) ]),


        ],


      ),),)
    );
  }

  void Show1(BuildContext ctx){
   showDialog(context: ctx, builder:(context) => AlertDialog(
    content: Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('แก้ไขที่อยู่ \n',style: TextStyle(fontSize: 28),),
    TextField(
          controller: new_address,
            style: const TextStyle(color: Colors.black),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),),
              label: Text('กรอกที่อยู่ใหม่',style: TextStyle(color: Colors.black),),
            ),
            
          ),
    ]),
    actions: [TextButton(onPressed: (){
        Login_db.address = new_address.text;
        
        Navigator.of(ctx).pop();
        setState(() {
          
        });
      }, 
      child: Text('ยืนยัน')) ],
  ),
  
  ); 
}
void Show2(BuildContext ctx){
   showDialog(context: ctx, builder:(context) => AlertDialog(
    content: Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('แก้ไขเบอร์โทร \n',style: TextStyle(fontSize: 28),),
    TextField(
          controller: new_phone,
            keyboardType: TextInputType.numberWithOptions(),
            style: const TextStyle(color: Colors.black),
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:const  BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),),
              label: Text('กรอกเบอร์โทรใหม่',style: TextStyle(color: Colors.black),),
            ),
            
          ),
    ]),
    actions: [TextButton(onPressed: (){
        Login_db.phone = new_phone.text;
        Navigator.of(ctx).pop();
        setState(() {
           //Login_db.phone = new_phone.text;
        });
      }, 
      child: Text('ยืนยัน')) ],
  ),
  
  ); 
  
  }

List<Widget> buildListview() {
  var list = <Widget> [];

  for(int i = 0 ; i < add_pro.order.length; i++){
    list.add(ListTile(
      leading: Text('การสั่งซื้อครั้งที่ ${i+1} '),
      trailing: Text('ราตารวม : ${add_pro.order[i]} บาท'),
      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color.fromARGB(255, 101, 31, 2)),
        borderRadius: BorderRadius.circular(10)
        ),
    

    ),);
    list.add(SizedBox(height: 10,));
  }

  return list;
}


}