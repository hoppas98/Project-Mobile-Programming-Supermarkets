import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/pages/product_details.dart';
import 'package:otlobly/screens/owner/manage_product.dart';
import 'package:otlobly/services/store.dart';
import 'package:http/http.dart' as http;
import 'package:otlobly/models/cart.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/models/HTTPexception.dart';
import 'dart:convert';

class Products extends StatefulWidget with ChangeNotifier {
  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> with ChangeNotifier {
  final _store = Store();
  static List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                productList = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;

                  productList.add(Product(
                    pId: doc.documentID,
                    pName: data['productName'],
                    pPrice: data['productPrice'],
                    pDescription: data['productDescription'],
                    pLocation: data['productLocation'],
                    pCategory: data['productCategory'],
                  ));
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Stack(children: [
                        Positioned.fill(
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(productList[index].pLocation),
                          ),
                        ),
                        InkWell(
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ManageProduct()),
                            //   //we're gonna update the navigation here
                            // ),
                            ),
                        Positioned(
                            bottom: 0,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productList[index].pName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('EGP ' + productList[index].pPrice),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                  ),
                  itemCount: productList.length,
                );
              }
            }));
  }

  List<Product> _items = [
    Product(
      pId: '1',
      pName: 'Dairy milk chocolate bar',
      pDescription:
          'Perfect As A Gift Or Special Treat Delicious On Its Own, Or Gently Melted For Dipping FruitPremium Milk ChocolateA Kosher Candy Bar',
      pPrice: '5.0',
      pLocation: 'https://images.heb.com/is/image/HEBGrocery/001151134',
    ),
    Product(
      pId: 'p2',
      pName: 'Pepsi 355 ml',
      pDescription:
          'The bold, refreshing, robust cola. Perfect for parties, meals, and celebrations big and small.',
      pPrice: '2.0',
      pLocation:
          'https://cdn.shopify.com/s/files/1/0036/4806/1509/products/33eb95e1fa7ee727d112760f7960e1c6c6f3ceee_square959333_1.jpg?v=1601834695',
    ),
    Product(
      pId: 'p3',
      pName: 'tresemme shampoo',
      pDescription:
          'Get that just-left-the-salon feel! TRESemmé® Clean & Replenish Shampoo will clarify and gently remove heavy residues that diminish your hair’s shine.',
      pPrice: '29.9',
      pLocation:
          'https://www.tresemme.com/content/dam/unilever/tresemme/united_states_of_america/pack_shot/00022400002200-1406482-png.png',
    ),
    Product(
      pId: 'p4',
      pName: 'Domty white cheese',
      pDescription:
          'ISTANBOLLY PLUS CHEESE. Ingredients: Made from pasteurized cow and buffalo milk ,kemel palm oil , natural butter , 5% skimmed milk powder, salt ,calcium.',
      pPrice: '14.99',
      pLocation:
          'https://qf7s26sxazr7uwqlogrl311.blob.core.windows.net/sys-master-root/h67/h23/9287017431070/400371_main.jpg_1700Wx1700H',
    ),
  ];

  List<Product> get items {
    return [...productList];
  }

  List<Product> get favoriteItems {
    return productList.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return productList.firstWhere((prod) => prod.pId == id);
  }

  void addProduct(Product product) {
    const url =
        "https://otlobly-supermarket-app-default-rtdb.firebaseio.com/orders.json";
    try {
      http
          .post(url,
              body: json.encode({
                'title': product.pName,
                'imageURL': product.pLocation,
                'price': product.pPrice,
                'description': product.pDescription,
                'isfavorite': product.isFavorite
              }))
          .then((response) {
        final newProduct = Product(
          pName: product.pName,
          pDescription: product.pDescription,
          pPrice: product.pPrice,
          pLocation: product.pLocation,
          pId: DateTime.now().toString(),
        );
        _items.add(newProduct);
        notifyListeners();
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.pId == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.pId == id);
    notifyListeners();
  }
}

void addOrder(List<CartItem> cartProducts, double total) {
  const url =
      "https://otlobly-supermarket-app-default-rtdb.firebaseio.com/orders.json";
  final timestamp = DateTime.now();
  http.post(url,
      body: json.encode({
        'id': DateTime.now().toString,
        'amount': total,
        'dateandtime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cartpro) => {
                  'proid': cartpro.id,
                  'proname': cartpro.title,
                  'quantity': cartpro.quantity,
                  'proprice': cartpro.price
                })
            .toList()
      }));
}
