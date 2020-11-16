class Products {
  String productName;
  String quantity;
  String price;
  String description;
  Products({this.productName, this.quantity, this.price, this.description});
}

class IProductData {
  int count = 0;
  List<Products> productDB = [
    Products(
        //0
        productName: 'Chocolate',
        quantity: '5',
        price: 'EGP 5',
        description: 'None'),
    Products(
        //1
        productName: 'Water',
        quantity: '100',
        price: 'EGP 2.5',
        description: '1L'),
    Products(
        //2
        productName: 'Soda',
        quantity: '150',
        price: 'EGP 7.5',
        description: '250ml'),
  ];

  List getProduct(int itemNumber) {
    return [
      productDB[itemNumber].productName,
      productDB[itemNumber].quantity,
      productDB[itemNumber].price,
      productDB[itemNumber].description
    ];
  }
}
