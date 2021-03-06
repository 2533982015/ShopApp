import 'package:comercial_app/data/products.dart';
import 'package:comercial_app/pages/cart_page.dart';
import 'package:comercial_app/pages/product_detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double DEFAULT_PADDING = 10.0;
const Color MAIN_COLOR = Color(0xFFEFF1E7);

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _currentCategory = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: _toCart,
              child: Padding(
                  padding: const EdgeInsets.only(right: DEFAULT_PADDING),
                  child:
                      Icon(Icons.shopping_bag_outlined, color: Colors.black)),
            )
          ]),
      body: Container(
          padding: const EdgeInsets.all(DEFAULT_PADDING),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Comercial SIVAR', style: TextStyle(fontSize: 24)),
            _searchBar(),
            _optionsTab(),
            _productsGrid()
          ])));

  Widget _searchBar() => Padding(
      padding: const EdgeInsets.symmetric(vertical: DEFAULT_PADDING * 2),
      child: TextField(
          decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        fillColor: Color(0xFFEFF1E7),
        filled: true,
        prefixIcon: Icon(Icons.search),
        hintText: 'Buscar',
      )));

  Widget _optionsTab() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(spacing: DEFAULT_PADDING * 3, children: [
        ...categories.map((category) {
          final index = categories.indexOf(category);
          return GestureDetector(
            onTap: () => setState(() => _currentCategory = index),
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: _currentCategory == index
                                ? Colors.grey
                                : Colors.transparent))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(category),
                )),
          );
        })
      ]));

  Widget _productsGrid() => Expanded(
      child: SizedBox.expand(
          child: GestureDetector(
              onHorizontalDragEnd: _detectSwipe,
              child: GridView.count(
                  padding: const EdgeInsets.only(top: DEFAULT_PADDING),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: DEFAULT_PADDING,
                  crossAxisSpacing: DEFAULT_PADDING,
                  children: [
                    ...products
                        .where((pro) => pro['category'] == _currentCategory)
                        .map((image) => GestureDetector(
                            onTap: _toDetail,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(
                                          width: double.infinity,
                                          color: MAIN_COLOR,
                                          child: Container(
                                            height: 125,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: DEFAULT_PADDING),
                                            child: Image(
                                                image: AssetImage(image['img']),
                                                fit: BoxFit.scaleDown),
                                          ))),
                                  SizedBox(height: DEFAULT_PADDING),
                                  Text(image['name'],
                                      style: TextStyle(fontSize: 16)),
                                  Text(image['price'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800))
                                ])))
                  ]))));

  void _detectSwipe(DragEndDetails dragEndDetails) => setState(() {
        if (dragEndDetails.primaryVelocity! < 0) {
          if (_currentCategory < products.length) _currentCategory++;
        } else if (dragEndDetails.primaryVelocity! > 0) {
          if (_currentCategory > 0) _currentCategory--;
        }
      });

  void _toDetail() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProductDetailPage()));

  void _toCart() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => CartPage()));
}
