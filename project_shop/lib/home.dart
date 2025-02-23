import 'package:flutter/material.dart';
import 'package:project_shop/nevigation_new.dart';
import 'package:project_shop/product.dart';

class Home extends StatefulWidget {
  
  const Home({super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      // appBar: AppBar(title: Text('ยินดีต้อนรับ'),centerTitle: true,backgroundColor:const Color.fromARGB(255, 195, 151, 50), ),
      body: Column(children: [
      SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Center(
          child: Column( children:[
          Container(
            width: 3400,height: 150,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/home.jpg'),fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), // ทำให้ภาพเข้มขึ้น
                        BlendMode.darken,
                      ),
                ),
                
              ),
              child: Center(child:Column(children: [ 
                SizedBox(height: 45,),
                Text('ยินดีต้อนรับสู่ร้าน',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                Text('BS_shop',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                
                ,],)),
              
            ),
          ),
          const SizedBox(height: 30,),
          Text('สินค้าขายดี',style: TextStyle(color: Color.fromARGB(255, 195, 151, 50), fontSize: 26,decoration: TextDecoration.underline, decorationColor: Color.fromARGB(255, 195, 151, 50),),),
          const SizedBox(height: 15,),
          SingleChildScrollView(scrollDirection: Axis.horizontal,
          child:
          Container(
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Container(
                  width: 200,height: 250,
                  child: Column( children: [
                    SizedBox(height: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Image.asset('images/1.1.jpg',width: 150,),
                    ),
                    SizedBox(height: 15,),
                    Text('หมวกแก๊ป สีดำ',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text('ราคา : 90 บาท'),
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 195, 151, 50),
                  ),
                ),
                const SizedBox(width: 5,),
                   Container(
                  width: 200,height: 250,
                  child: Column( children: [
                    SizedBox(height: 20,),
                     ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Image.asset('images/2.1.png',width: 110,),
                     ),
                    SizedBox(height: 15,),
                    Text('หมวกบีนนี่ สีคลีม',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text('ราคา : 105 บาท'),
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 195, 151, 50),
                  ),

                ),
                  const  SizedBox(width: 5,),
                   Container(
                  width: 200,height: 250,
                  child: Column( children: [
                    SizedBox(height: 20,),
                     ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Image.asset('images/เบเร่ต์ เบจ.png',width: 150,),
                     ),
                    SizedBox(height: 15,),
                    Text('หมวดเบเร่ต์ สีเบจ',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text('ราคา : 120 บาท'),
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 195, 151, 50),
                  ),

                ),
                   const SizedBox(width: 5,),


                   Container(
                  width: 200,height: 250,
                  child: Column( children: [
                    SizedBox(height: 20,),
                     ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Image.asset('images/3.3.jpg',width: 150,),
                     ),
                    SizedBox(height: 15,),
                    Text('หมวด บักเก็ต สีชมพู',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                    SizedBox(height: 6,),
                    Text('ราคา : 95 บาท'),
                  ],),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 195, 151, 50),
                  ),

                ),
            ],),)


          )   ,
      const SizedBox(height: 20,),      
      ElevatedButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Product()));
        },
        child: Text('ดูสินค้า'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown[600],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      const SizedBox(height: 20,),
      Container(
        width: 400,
        padding:EdgeInsets.all(20) ,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 195, 151, 50),
       ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/people.jpg',width: 130,),),
            Text(' ดีไซน์ทันสมัย เหมาะกับทุกไลฟ์สไตล์ \n วัสดุคุณภาพ สวมใส่สบาย \n จัดส่งรวดเร็ว มั่นใจได้ทุกการสั่งซื้อ'),
          ],
        ),
      )
      

        ],),
      ),),],),

    );
  }
}