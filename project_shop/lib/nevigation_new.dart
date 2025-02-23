import 'package:flutter/material.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:project_shop/cart.dart';
import 'package:project_shop/data_save.dart';
import 'package:project_shop/home.dart';
import 'package:project_shop/product.dart';
class Test extends StatefulWidget {
   Test({super.key});

  @override
  State<Test> createState() => _TestState();
}
/*



ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้
ไม่ได้ใช้



 */
class _TestState extends State<Test> {
   int currentPage = 0;
  void setnew(int x){ 
    setState(() {
    currentPage = x;
  });}
  final ScrollController _scrollController = ScrollController();
  var page = <Widget>[Home(),Product(),Product()];
 
  
  @override
  Widget build(BuildContext context) {
  

    
    return Scaffold(
      extendBody: true,
      body: page[currentPage],

      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: _scrollController,

        hideOnScroll: true,
        indicatorColor: const Color.fromARGB(255, 101, 31, 2),
        backgroundColor: Color.fromARGB(255, 195, 151, 50),
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        
        
        selectedIndex: currentPage,
        indicatorSize: 5,
        borderRadius: 25,
        height: 70,
        
        onTap: (index) {
          if (index == 2) {
           
             setState(() {
              currentPage = 1;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cart()),
              
            );
           
            }else{
          setState(() => currentPage = index);}
        },
        items: [
          Column(children: [
          Icon(Icons.home, color: currentPage == 0 ? Color.fromARGB(255, 101, 31, 2) : Colors.white,),
          Text('Home'),
          SizedBox(height: 10,)
          
          ]),
          Column(children: [
          Icon(
            Icons.content_paste_search_sharp,
            color: currentPage == 1 ? Color.fromARGB(255, 101, 31, 2) : Colors.white,
          ),
          Text('Product'),
             SizedBox(height: 10,)
          ]),
          Column(children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: currentPage == 2 ? Color.fromARGB(255, 101, 31, 2) : Colors.white,
          ),
           Text('Cart'),
             SizedBox(height: 10,)
          ]),
          Column(children: [
          Icon(
            Icons.person,
            color: currentPage == 3 ? Color.fromARGB(255, 101, 31, 2) : Colors.white,
          ),
           Text('โปรไฟล์'),
             SizedBox(height: 10,)
          ]),
        ],
        // items: items(),
      ),
    );
  }
  //  List<Widget> items()  {
  //   var iconItem = [Icons.home,Icons.shopping_cart,Icons.person,Icons.help];
  //   var labelItem = ['Home','Product','Member','Help'];
  //   List<BottomNavigationBarItem> mybtn; 
  //   BottomNavigationBarItem create(index){
  //     return BottomNavigationBarItem(icon:Icon(iconItem[index]),label:labelItem[index]);
  //   }
  //   return mybtn = List.generate(iconItem.length, create);
  // }
}