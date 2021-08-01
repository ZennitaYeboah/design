import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({required this.image, required this.label});
  late final String image;
  late final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: ListTile(
          leading: Image(
            height: 30.0,
            image: AssetImage(image),
          ),
          title: Text(label),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwippableCards(
        image: DecorationImage(
            image: AssetImage('images/background1.jpg'), fit: BoxFit.cover),
        label: "Women Blue Denim",
        price: "\$30.00");
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwippableCards(
        image: DecorationImage(
            image: AssetImage('images/background1.jpg'), fit: BoxFit.cover),
        label: "Women Blue Denim",
        price: "\$30.00");
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwippableCards(
        image: DecorationImage(
            image: AssetImage('images/background1.jpg'), fit: BoxFit.cover),
        label: "Women Blue Denim",
        price: "\$30.00");
  }
}

class SwippableCards extends StatelessWidget {
  late final DecorationImage image;
  late final String label;
  late final String price;
  SwippableCards(
      {required this.image, required this.label, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (60 / 100) * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(30),
          image: image),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.lightBlueAccent,
                  focusColor: Colors.grey,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "What are you looking for?",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommendations",
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                ),
                Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                Text(
                  price,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  late final String name;
  late final String price;
  late final DecorationImage image;
  ShopCard({required this.image, required this.name, required this.price});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 150,
              decoration: BoxDecoration(
                image: image,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(name),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
              child: Text(
                price,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
