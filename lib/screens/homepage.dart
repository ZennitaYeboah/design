import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design/components/cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List cardList = [
    Item1(),
    Item2(),
    Item3(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.55,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  child: card,
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(cardList, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        "Show all",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ShopCard(
                          image: DecorationImage(
                              image: AssetImage("images/background1.jpg"),
                              fit: BoxFit.fill),
                          name: "Russ Shirt",
                          price: "\$19.99",
                        ),
                        ShopCard(
                          image: DecorationImage(
                              image: AssetImage("images/background.webp"),
                              fit: BoxFit.fill),
                          name: "Comfort Jacket",
                          price: "\$50.90",
                        ),
                        ShopCard(
                          image: DecorationImage(
                              image: AssetImage("images/background1.jpg"),
                              fit: BoxFit.fill),
                          name: "Russ Shirt",
                          price: "\$19.99",
                        ),
                        ShopCard(
                          image: DecorationImage(
                              image: AssetImage("images/background.webp"),
                              fit: BoxFit.fill),
                          name: "Russ Shirt",
                          price: "\$19.99",
                        ),
                        ShopCard(
                          image: DecorationImage(
                              image: AssetImage("images/background1.jpg"),
                              fit: BoxFit.fill),
                          name: "Russ Shirt",
                          price: "\$19.99",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        "Show all",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Categories(
                        image: "images/man.jpg",
                        label: "Men",
                      ),
                      Categories(
                        image: "images/woman.jpg",
                        label: "Women",
                      ),
                      Categories(
                        image: "images/woman.jpg",
                        label: "Summer",
                      ),
                      Categories(
                        image: "images/woman.jpg",
                        label: "WInter",
                      ),
                      Categories(
                        image: "images/woman.jpg",
                        label: "Sports",
                      ),
                      Categories(
                        image: "images/woman.jpg",
                        label: "Casual",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
