import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';

class Product2 extends StatefulWidget {
  const Product2({super.key});

  @override
  State<Product2> createState() => _Product2State();
}

class _Product2State extends State<Product2> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      appBar: AppBar(title: Text('หมวด บีนนี่'),titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),centerTitle: true,backgroundColor: const Color.fromARGB(255, 253, 203, 88),),
      body: GridView.builder(
        itemCount: 5,
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
    var pd2 = ['สีคลีม','สีดำ','สีน้ำเงิน','สีขาว','สีชมพู',];
    int price = 105;
    var unit = 1;
    var img = ['images/2.1.png','images/2.2.png','images/2.3.png','images/2.4.png','images/2.5.png',];
    return GridTile(
      child:InkWell(
        child: Image.asset(img[index],fit:BoxFit.cover),
        onTap:()=>MSB(ctx, index, pd2[index], price, img[index]) ,) ,
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(pd2[index]),
        subtitle: Text('ราคา $price บาท'),
        trailing: InkWell(
          child: const Icon(Icons.add,size: 32,color: Colors.amber,),
          onTap: () {
             cart_icon.addCart();
             add_pro.product.add('หมวกบีนนี่ ${pd2[index]}');
               //unit1[index] = unit1[index]+1;
              add_pro.units.add(unit);
              add_pro.price.add(price);
              add(context);
          })
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
    Text('\nชื่อสินค้า : หมวกบีนนี่${pd} \nขนาด	: Free size  \nน้ำหนัก : 600 กรัม \nราคา : ${price}'),]),
    actions: [TextButton(onPressed: ()=>Navigator.of(ctx).pop(), child: Text('ย้อนกลับ'))],
  ),); 
  
  }
  
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