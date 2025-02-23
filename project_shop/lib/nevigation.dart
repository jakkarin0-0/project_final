import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:project_shop/cart.dart';
import 'package:project_shop/data_save.dart';
import 'package:project_shop/home.dart';
import 'package:project_shop/product.dart';
import 'package:project_shop/product1.dart';
import 'package:project_shop/profile.dart';
import 'package:badges/badges.dart' as badges;

class Nevigation extends StatefulWidget {
  const Nevigation({super.key});

  @override
  State<Nevigation> createState() => _NevigationState();
}

class _NevigationState extends State<Nevigation> {
  int navigation_index = 0;
  var page = <Widget>[Home(),Product(),Cart(),Profile()];
  int _page = 0;
  int cartitem = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
   
  @override
  Widget build(BuildContext context) {
     cart_icon.addCart = () {
      setState(() {
        cartitem++;
      });
    };

    cart_icon.removeCart = (){
      setState(() {
       
          cartitem = 0;
        
      });
    };

  
    
    // return Scaffold(

    //   body: page[navigation_index],

    //   bottomNavigationBar: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //   backgroundColor: Color.fromARGB(255, 253, 203, 88),
    //     fixedColor: Color.fromARGB(255, 193, 136, 2),
    //     showSelectedLabels: true,
    //     showUnselectedLabels: true,
    //     currentIndex: navigation_index,
    //     items: items(),
    //     onTap: (index) { // เมื่อคลิ๊กปุ่ม 
    //         setState(() {
    //           navigation_index = index;
    //         });
    //       },
        
    //     )
    // );
  return Scaffold(
        
        bottomNavigationBar: CurvedNavigationBar(
          
          key: _bottomNavigationKey,
          index: 0,
          items: [

             CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
            ),

             CurvedNavigationBarItem(
            child: Icon(Icons.content_paste_search_sharp),
            label: 'Product',
          ), 
          
            CurvedNavigationBarItem(
            child:badges.Badge(
              showBadge: (cartitem>0)?true:false,
              badgeStyle: badges.BadgeStyle(badgeColor: const Color.fromARGB(255, 245, 39, 24)),
              position: badges.BadgePosition.topStart(),
              badgeAnimation: badges.BadgeAnimation.fade(),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            
            label: 'Cart',
            
          ),
            
             CurvedNavigationBarItem(
            child: Icon(Icons.person_outline_rounded),
            label: 'User',
          ),
            
          ],
          color: Color.fromARGB(255, 195, 151, 50),
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 101, 31, 2),
          animationCurve: Curves.easeInOut,
          
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: page[_page]
        
        );
  }
  // List<BottomNavigationBarItem> items()  {
  //   var iconItem = [Icons.home,Icons.shopping_cart,Icons.person,Icons.help];
  //   var labelItem = ['Home','Product','Member','Help'];
  //   List<BottomNavigationBarItem> mybtn; 
  //   BottomNavigationBarItem create(index){
  //     return BottomNavigationBarItem(icon:Icon(iconItem[index]),label:labelItem[index]);
  //   }
  //   return mybtn = List.generate(iconItem.length, create);
  // }

  
}