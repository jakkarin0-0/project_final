import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';

class Product4 extends StatefulWidget {
  const Product4({super.key});

  @override
  State<Product4> createState() => _Product4State();
}

class _Product4State extends State<Product4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      appBar: AppBar(title: Text('หมวด ชนิดอื่นๆ'),titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),centerTitle: true,backgroundColor: const Color.fromARGB(255, 253, 203, 88),),
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
    var pd4 = ['หมวกเดินป่า','หมวกคลุมใบหน้า','หมวกโบ๊ทเตอร์','หมวดเบเร่ต์ สีดำ','หมวดเบเร่ต์ สีเทาอ่อน','หมวดเบเร่ต์ สีชมพู','หมวดเบเร่ต์ สีแดง','หมวดเบเร่ต์ สีเบจ'];
    var price = [80,75,90,120,120,120,120,120];
    var unit = 1;
    var img = ['images/4.1.jpg','images/4.2.jpg','images/Boater.jpg','images/เบเร่ต์ ดำ.png','images/เบเร่ต์ เทาอ่อน.png','images/เบเร่ต์ ชมพู.png','images/เบเร่ต์ แดง.png','images/เบเร่ต์ เบจ.png'];
    return GridTile(
      child:InkWell(
        child: Image.asset(img[index],fit:BoxFit.cover),
        onTap:()=>MSB(ctx, index, pd4[index], price[index], img[index]) ,) ,
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(pd4[index]),
        subtitle: Text('ราคา ${price[index]} บาท'),
        trailing: InkWell(
          child: const Icon(Icons.add,size: 32,color: Colors.amber,),
          onTap: () {
             cart_icon.addCart();
            add_pro.product.add('หมวกบีนนี่ ${pd4[index]}');
               //unit1[index] = unit1[index]+1;
              add_pro.units.add(unit);
              add_pro.price.add(price[index].toInt());
                add(context);
          })
      ),

      );
  }

  void MSB(BuildContext ctx,int index ,String pd,int price,String img ) {
    var size = ['Free size','55 cm.','58 cm.','60 cm.','60 cm.','60 cm.','60 cm.','60 cm.'];
    var w = ['400 กรัม','400 กรัม','150 กรัม','200 กรัม','200 กรัม','200 กรัม','200 กรัม','200 กรัม',];
    showDialog(context: ctx, builder:(context) => AlertDialog(
    content:Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('ข้อมูลสินค้า \n\n',style: TextStyle(fontSize: 16),),
    Image.asset(img),
    Text('\nชื่อสินค้า : ${pd} \nขนาด : ${size[index]} \nน้ำหนัก : ${w[index]} \nราคา : ${price}'),]),
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
