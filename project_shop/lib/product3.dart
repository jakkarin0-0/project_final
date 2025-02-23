import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';

class Product3 extends StatefulWidget {
  const Product3({super.key});

  @override
  State<Product3> createState() => _Product3State();
}

class _Product3State extends State<Product3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      appBar: AppBar(title: Text('หมวด บักเก็ต'),titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),centerTitle: true,backgroundColor: const Color.fromARGB(255, 253, 203, 88),),
      body: GridView.builder(
        itemCount: 8,
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
    var pd3 = ['สีดำ','สีขาว','สีชมพู','สีฟ้า','สีเขียว','สีแดง','สีกรมท่า','สีม่วง'];
    int price = 95;
    var unit =1;
    var img = ['images/3.1.jpg','images/3.2.jpg','images/3.3.jpg','images/3.4.jpg','images/3.5.jpg','images/3.6.jpg','images/3.7.jpg','images/3.8.jpg'];
    return GridTile(
      child:InkWell(
        child: Image.asset(img[index],fit:BoxFit.cover),
        onTap:()=>MSB(ctx, index, pd3[index], price, img[index]) ,) ,
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(pd3[index]),
        subtitle: Text('ราคา $price บาท'),
        trailing: InkWell(
          child: const Icon(Icons.add,size: 32,color: Colors.amber,),
          onTap: () {
             cart_icon.addCart();
            add_pro.product.add('หมวกบักเก็ต ${pd3[index]}');
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
    Text('\nชื่อสินค้า : หมวกบักเก็ต${pd} \nขนาด : Free size \nน้ำหนัก : 500 กรัม \nราคา : ${price}'),]),
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