import 'package:flutter/material.dart';

import '../db/sql_db.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> showProducts() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM products AS P JOIN cart AS C WHERE P.id = C.productID");
    print(response);
    return response;
  }

  Future<List<Map>> removeFromCart(var id) async {
    List<Map> response = await sqlDb.deleteData("DELETE FROM cart WHERE productID = $id;");
    return response;
  }

  Future<int> clearCart() async {
    int response = await sqlDb.deleteData("DELETE FROM cart;");
    return response;
  }

  Future<List<Map>> totalCount() async {
    List<Map> response = await sqlDb.readData("SELECT SUM(price) FROM products AS p JOIN cart AS c WHERE p.id = c.productID");
    print(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              clearCart();
            });
          }, icon: Icon(Icons.restore_from_trash_rounded))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: FutureBuilder(
                  future: showProducts(),
                  builder: (context, snap){
                    if(snap.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    else if (snap.connectionState==ConnectionState.done){
                      if(snap.hasError){
                        return Center(child: Text("ERROR", style: TextStyle(fontSize: 30),),);
                      }
                      if(snap.hasData){
                        return ListView.builder(
                            itemCount: snap.data!.length,
                            itemBuilder: (context, i){
                              return Card(
                                child: ListTile(
                                  title: Text("${snap.data?[i]["name"]}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                  subtitle: Text("${snap.data?[i]["description"]}", style: TextStyle(fontSize: 18),),
                                  leading: Text("${snap.data?[i]["price"]}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                  trailing: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        removeFromCart(snap.data?[i]["id"]);

                                      });
                                    },
                                    icon: Icon(Icons.remove_circle_outline_rounded, color: Colors.red,),
                                  ),

                                ),
                              );
                            });
                      }
                    }

                    return Text("");

                  }),
            ),
            Divider(thickness: 2, color: Colors.red,),
            Text("Total =${totalCount()}", style: TextStyle(fontSize: 26),)

          ],
        ),
      ),
    );
  }
}
