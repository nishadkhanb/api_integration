import 'package:app_1/controller/api_connection.dart';
import 'package:app_1/models/products_model.dart';
import 'package:app_1/productsinfo.dart';
import 'package:flutter/material.dart';

class APIIntegration extends StatelessWidget {
  const APIIntegration({super.key});

  @override
  Widget build(BuildContext context) {
    APIConnection apiConnection = APIConnection();
    return Scaffold(
      appBar: AppBar(
        title: Text('Products List'),
      ),
      body: FutureBuilder(
        future: apiConnection.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductsModel> products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(
                          products[index].title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(products[index].price!.toString()),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(products[index].image!),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Info(
                              id: products[index].id,
                              image: products[index].image,
                              title: products[index].title,
                              price: products[index].price,
                              description: products[index].description,
                            ),
                          ));
                        }),
                  );
                },
                itemCount: products.length,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
