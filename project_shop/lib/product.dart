import 'package:flutter/material.dart';
import 'package:project_shop/product1.dart';
import 'package:project_shop/product2.dart';
import 'package:project_shop/product3.dart';
import 'package:project_shop/product4.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      appBar: AppBar(title: Text('ประเภทสินค้า'),centerTitle: true,backgroundColor: const Color.fromARGB(255, 253, 203, 88),),

      body:
      
      
      GridView.builder(
        
        itemCount: 4,
        
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/4, //ขนาดรูป เช่น กว้าง 3 สูง4
          crossAxisSpacing: 20, //5ระยะห่าง แนวนอน
          mainAxisSpacing: 25),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:grid(context, index),
        ) ,
          
          
        )
        
    );
    
  }
Widget grid(BuildContext ctx , int index) {
    var pd = ['แก๊ป','บีนนี่','บักเก็ต','อื่นๆ'];
    var navigator_product  = [Product1(),Product2(),Product3(),Product4()];
    var img = ['images/แกร็ป.jpg','images/Beanie.jpg','images/Bucke.jpg','images/รวม.jpg'];
    return GridTile(
      child: Image.asset(img[index],fit:BoxFit.cover),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(pd[index],style: TextStyle(fontSize: 20,),),
        trailing: InkWell(
          child: Icon(Icons.search),
          onTap: () => {Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>navigator_product[index]))},)
      ),

      );
  } 



}