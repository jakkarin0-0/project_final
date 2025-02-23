import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';
import 'package:project_shop/database/database.dart';
import 'package:project_shop/database/product_model.dart';

class Product1 extends StatefulWidget {
  const Product1({super.key});

  @override
  State<Product1> createState() => _Product1State();
  
}

class _Product1State extends State<Product1> {
  Database db = Database.myInstans;
  CollectionReference a = FirebaseFirestore.instance.collection("product");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      appBar: AppBar(title: Text('หมวด แก๊ป'),titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),centerTitle: true,backgroundColor: const Color.fromARGB(255, 253, 203, 88),),
      body: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/4, //ขนาดรูป เช่น กว้าง 3 สูง4
          crossAxisSpacing: 5, //ระยะห่าง แนวนอน
          mainAxisSpacing: 30),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:grid(context, index),
        ) ,
          
          
        )
    );
  }

  Widget grid(BuildContext ctx , int index) {
    var pd1 = ['สีดำ','สีขาว','สีแดง','สีชมพู','สีม่วง','สีฟ้า','สีน้ำตาล','สีเหลือง','สีเทา','สีเขียว',];
    var unit1 = 1;
    //var t = [0,0,0,0,0,0,0,0,0,0,];
    int prices = 90;
    var img = ['images/1.1.jpg','images/1.2.jpg','images/1.3.jpg','images/1.4.jpg','images/1.5.jpg','images/1.6.jpg','images/1.7.jpg','images/1.8.jpg','images/1.9.jpg','images/1.10.jpg',];
    return GridTile(
      child:InkWell(child: Image.asset(img[index],fit:BoxFit.cover),onTap:()=>MSB(ctx, index, pd1[index], prices.toInt(), img[index]) ,) ,
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(pd1[index]),
        subtitle: Text('ราคา $prices บาท'),
        trailing: InkWell(
          child: const Icon(Icons.add,size: 32,color: Colors.amber,),
          onTap: () {
              
             cart_icon.addCart();
             add_pro.product.add('หมวกแก๊ป ${pd1[index]}');
               //unit1[index] = unit1[index]+1;
              add_pro.units.add(unit1);
              add_pro.price.add(prices);
              add(ctx);
          
            
          },
          // onTap: ()   async {
          //     String newId = 'PD${DateTime.now().millisecondsSinceEpoch.toString()}';
          //     await db.setProduct(
          //     product: ProductModel(id: newId ,productName: pd1[index],  price: prices ) 
          // );

          // },
        )
      ),

      );
  }

  void MSB(BuildContext ctx,int index ,String pd,int price,String img ) {
    showDialog(context: ctx, builder:(context) => AlertDialog(
    content:Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('ข้อมูลสินค้า \n\n',style: TextStyle(fontSize: 16),),
    Image.asset(img),
    Text('\nชื่อสินค้า : หมวกแก๊ป${pd} \nขนาด	: 54-58 cm. \nน้ำหนัก : 500 กรัม \nราคา : ${price}'),]),
    actions: [TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: Text('ย้อนกลับ'))],
  ),); }

  void add(BuildContext ctx, ) {
    showDialog(context: ctx, builder:(context) => AlertDialog(
    content:Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('เพิ่มสินค้า\n',style: TextStyle(fontSize: 20),),
    Image.asset('images/true.png'),
    Center(child: Text('ได้เพิ่มสินค้าเข้าตะกร้าแล้ว')),]),
    
    actions: [TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: Text('ย้อนกลับ'))],
  ),); }
}