import 'package:flutter/material.dart';

class Product1 extends StatefulWidget {
  const Product1({super.key});

  @override
  State<Product1> createState() => _Product1State();
}

class _Product1State extends State<Product1> {
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
    var price = 90;
    var img = ['images/1.1.jpg','images/1.2.jpg','images/1.3.jpg','images/1.4.jpg','images/1.5.jpg','images/1.6.jpg','images/1.7.jpg','images/1.8.jpg','images/1.9.jpg','images/1.10.jpg',];
    return GridTile(
      child:InkWell(child: Image.asset(img[index],fit:BoxFit.cover),onTap:()=>MSB(ctx, index, pd1[index], price, img[index]) ,) ,
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(pd1[index]),
        subtitle: Text('ราคา $price บาท'),
        trailing: InkWell(
          child: const Icon(Icons.add,size: 32,color: Colors.amber,),
          onTap: () => {},)
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
}