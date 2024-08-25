import 'package:flutter/material.dart';

import '../db/sql_db.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {


  SqlDb sqlDb = SqlDb();
  Future<List<Map>> showProducts() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM products;");
    print(response);
    return response;
  }

  Future<List<Map>> addProductToCart(var proId) async {
    List<Map> response = await sqlDb.updateData("INSERT INTO cart (productID) VALUES ($proId)");
    print("---------------------------------------------------------- inserted to cart");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products",style: TextStyle(fontSize: 24),),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed("cart");
          }, icon: Icon(Icons.card_travel))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                                    addProductToCart(snap.data?[i]["id"]);

                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.green,),
                              ),

                            ),
                          );
                      });
                }
              }

              return Text("");

            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addNewProduct");
        },
        child:  Icon(Icons.add),
      ),
    );
  }
}
