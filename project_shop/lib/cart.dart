import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_shop/data_save.dart';
import 'package:project_shop/nevigation.dart';

class Cart extends StatefulWidget {
   const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
List<int> X = [];
  int sum = 0;

 
 int roop = add_pro.price.length;
  @override
  Widget build(BuildContext context) { 
   
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 203),
      
      appBar: AppBar(title: Text('ตะกร้าสินค้า',style: TextStyle(fontSize: 26),),backgroundColor: Color.fromARGB(255, 195, 151, 50)),
      body:
      Column(
        children: [
          //const SizedBox(height: 30),
          //Text('ตะกร้าสินค้า',style: TextStyle(fontSize: 20),),
          const SizedBox(height: 30),
          Padding(padding: EdgeInsets.only(left: 25),child: 
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('User : ${Login_db.User}',style: TextStyle(fontSize: 18),),],),),

          const SizedBox(height: 30),
          SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Padding(padding: EdgeInsets.only(left: 25),child: 
          Row( mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('ที่อยู่จัดส่ง : ${Login_db.address}',style: TextStyle(fontSize: 18)),],),),
          ),
          const SizedBox(height: 30),
          Container(width: 500, decoration: BoxDecoration( color:Color.fromARGB(255, 101, 31, 2) ,borderRadius: BorderRadius.circular(10)), child:Center(child:  Text('ตะกร้าสินค้า',style: TextStyle( color:Colors.white,fontSize: 18 ),),),),
          const SizedBox(height: 30),
          Padding(padding: EdgeInsets.only(left: 30,right: 40),child: Row(   
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('สินค้า :',style: TextStyle(fontSize: 20),),
              
              Text('ราคา :',style: TextStyle(fontSize: 20),),

            ],
          ),),
          
          Expanded(
            child:Container(
           
            child:  ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: add_pro.product.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 101, 31, 2),
                indent: 10,
                endIndent: 10,
              
              ),
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(), 
                onDismissed: (direction) {
                  if(direction == DismissDirection.endToStart){
                   // int remove = add_pro.price[index];
                    add_pro.product.removeAt(index);
                    add_pro.units.removeAt(index);
                    add_pro.price.removeAt(index);
                    //sum -= remove;
                    setState(() {
               
                      total(roop);
                    });
                    delete(context);

                  }
                },
                direction: DismissDirection.endToStart,
                background: Container(color: const Color.fromARGB(255, 140, 9, 0), alignment: Alignment.centerRight, padding: EdgeInsets.only(right: 20),child:  Text('ลบสินค้า',style: TextStyle(color: Colors.white ),),),
                
                child:buildListItem(context, index), ),
              
            ),
          ),),
          const SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
              total(roop),
              const SizedBox(width: 10,)],),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             ElevatedButton(
              onPressed: () { 
                add_pro.order.add(sum);
                Show(context,add_pro.product.length); 
                add_pro.product.clear();
                add_pro.units.clear();
                add_pro.price.clear();
                setState(() {
                  Cart();
                });
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('ยืนยัน', style: TextStyle(color: Colors.white)),
            ),
          
          SizedBox(width: 20,)
          ],),

          SizedBox(height: 10,)
        ],
      ),
    );
  }
  Widget buildListItem(BuildContext ctx , int index) {
    return ListTile(
      //title: value(index),
      title:  Text(add_pro.product[index].toString(), style: TextStyle(fontSize: 18),),
      subtitle: Text('จำนวน : ${add_pro.units[index].toString()} ชิ้น'),
      trailing: Text('${add_pro.price[index].toString()} บาท', style: TextStyle(fontSize: 18)),
  
    );
  }

  Widget value(int index) {
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${add_pro.product[index]}'),
          Text(add_pro.units[index].toString()),
    //      Text(add_pro.price[index].toString())
      ],
    );
    
     
    
  }

Widget total(int roop) {
  sum = 0;
  if(roop == 0){
    return Text('ยังไม่มีการเพิ่มตะกร้า',style: TextStyle(fontSize: 18),) ;
  }
  for(int x in add_pro.price){
    sum += x;
    
  }

  return    Text('ราคารวม : ${sum} บาท',style: TextStyle(fontSize: 18),) ;
}

void Show(BuildContext ctx,int index){
   showDialog(context: ctx, builder:(context) => AlertDialog(
    content:Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('ยืนยันการสั่งซื้อ \n',style: TextStyle(fontSize: 28),),
    Text('การสั่งซื้อสำเร็จ'),
    ]),
    actions: [TextButton(onPressed: (){
      
      Navigator.of(ctx).pop();
      cart_icon.removeCart();
      sum = 0;
      
      }, child: Text('ย้อนกลับ')) ],
  ),
  
  ); 
}

void delete(BuildContext ctx){
   showDialog(context: ctx, builder:(context) => AlertDialog(
    content:Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    Text('แจ้งเตือน \n',style: TextStyle(fontSize: 28),),
    Text('ลบสินค้าสำเร็จ'),
    ]),
    actions: [TextButton(onPressed: (){      
      Navigator.of(ctx).pop();
      }, child: Text('ย้อนกลับ')) ],
  ),
  
  ); 
}
}