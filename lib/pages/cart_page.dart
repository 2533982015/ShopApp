import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('Cart', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            item(),
            item(),
            _confirmar(),
          ],
        ),
      ),
    );
  }

  Widget item() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Flex(direction: Axis.horizontal, children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFEFF1E7),
                  borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                  width: 50,
                  height: 75,
                  child: Image(
                      image: AssetImage('assets/images/chair3.png'),
                      fit: BoxFit.contain)),
            )),
        Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Silla Guanaca', style: TextStyle(fontSize: 18)),
                  Text('100.00', style: TextStyle(fontWeight: FontWeight.w800))
                ],
              ),
            )),
        Expanded(flex: 1, child: Icon(Icons.close))
      ]),
    );
  }

  Widget _confirmar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          Row(children: [
            Text('Total: 100.00',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18))
          ])
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Text('Comprar'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    elevation: 0,
                    primary: Color(0XFFac935d))),
          ),
        )
      ],
    );
  }
}
