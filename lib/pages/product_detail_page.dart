import 'package:flutter/material.dart';

const double DEFAULT_PADDING = 10.0;
const Color MAIN_COLOR = Color(0xFFEFF1E7);

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage();

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentImage = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: MAIN_COLOR,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: DEFAULT_PADDING),
                child: Icon(Icons.shopping_bag_outlined))
          ]),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: MAIN_COLOR,
          child: Stack(children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: _getImage()),
            Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DEFAULT_PADDING,
                            vertical: DEFAULT_PADDING * 3),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Silla Guanaca',
                                  style: TextStyle(fontSize: 24)),
                              Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.amber),
                                  Icon(Icons.star, color: Colors.grey.shade300),
                                  Text(' 200 reviews')
                                ],
                              ),
                              SizedBox(height: DEFAULT_PADDING * 2),
                              Text('description de imagenF'),
                              SizedBox(height: DEFAULT_PADDING * 2),
                              Wrap(
                                  direction: Axis.horizontal,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: SizedBox(),
                                      onPressed: () =>
                                          setState(() => _currentImage = 1),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          shape: CircleBorder()),
                                    ),
                                    ElevatedButton(
                                      child: SizedBox(),
                                      onPressed: () =>
                                          setState(() => _currentImage = 2),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.amber,
                                          shape: CircleBorder()),
                                    ),
                                    ElevatedButton(
                                      child: SizedBox(),
                                      onPressed: () =>
                                          setState(() => _currentImage = 3),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          shape: CircleBorder()),
                                    ),
                                  ]),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: DEFAULT_PADDING,
                                    vertical: DEFAULT_PADDING),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.shopping_bag_outlined),
                                      label: Text('Comprar'),
                                      style: ElevatedButton.styleFrom(
                                          padding:
                                              EdgeInsets.all(DEFAULT_PADDING),
                                          elevation: 0,
                                          primary: Color(0XFFac935d))),
                                ),
                              ),
                            ]))))
          ])));

  Widget _getImage() {
    switch (_currentImage) {
      case 1:
        return Image(
            image: AssetImage('assets/images/chair3.png'), fit: BoxFit.none);
      case 2:
        return Image(
            image: AssetImage('assets/images/chair2.png'), fit: BoxFit.none);
      case 3:
      default:
        return Image(
            image: AssetImage('assets/images/chair1.png'), fit: BoxFit.none);
    }
  }
}
