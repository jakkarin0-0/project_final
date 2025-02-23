import 'package:project_shop/database/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Database {
  static Database myInstans = Database();

   Stream<List<ProductModel>> getproductstream(){
     var reference = FirebaseFirestore.instance.collection('project');
     Query query = reference.orderBy('id', descending: true);
     var querySnapshot = query.snapshots(); //ดึงข้อมูลแล้วส่งมาเก็ยไว้ที่ querysnapshot  
    
    return querySnapshot.map(
      
      (snapshots){
        return snapshots.docs.map(
          
          (doc){
            return ProductModel.formMap(doc.data() as Map<String,dynamic>);

          }).toList(); //return แบบ list 
      }
    );

   }

  Future<void> setProduct({required ProductModel product})async{
    var reference = FirebaseFirestore.instance.doc('project/${product.id}');
    try { 
      await reference.set(product.toMap());
    }catch (e){
      rethrow;
    }
  }
}