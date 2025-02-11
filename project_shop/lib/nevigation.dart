import 'package:flutter/material.dart';
import 'package:project_shop/home.dart';
import 'package:project_shop/product.dart';
import 'package:project_shop/product1.dart';

class Nevigation extends StatefulWidget {
  const Nevigation({super.key});

  @override
  State<Nevigation> createState() => _NevigationState();
}

class _NevigationState extends State<Nevigation> {
  int navigation_index = 0;
  var page = <Widget>[Home(),Product()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: page[navigation_index],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 253, 203, 88),
        fixedColor: Color.fromARGB(255, 193, 136, 2),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: navigation_index,
        items: items(),
        onTap: (index) { // เมื่อคลิ๊กปุ่ม 
            setState(() {
              navigation_index = index;
            });
          },
        
        )
    );

  }
  List<BottomNavigationBarItem> items()  {
    var iconItem = [Icons.home,Icons.shopping_cart,Icons.person,Icons.help];
    var labelItem = ['Home','Product','Member','Help'];
    List<BottomNavigationBarItem> mybtn; 
    BottomNavigationBarItem create(index){
      return BottomNavigationBarItem(icon:Icon(iconItem[index]),label:labelItem[index]);
    }
    return mybtn = List.generate(iconItem.length, create);
  }

  
}