import 'package:flutter/material.dart';
import 'package:market_store_discount/discount_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  GoldCard goldCard = GoldCard(turnover: 1500.0, purchaseValue: 1300.0);
  SilverCard silverCard = SilverCard(turnover: 600.0, purchaseValue: 850.0);
  BronzeCard bronzeCard = BronzeCard(turnover: 0.0, purchaseValue: 150);

  @override
  Widget cardTemplate(card, color, getTotalPrice) {
    print(bronzeCard.getTotalPrice());
    print(silverCard.getTotalPrice());
    print(goldCard.getTotalPrice());

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: color,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Something",
              style: TextStyle(fontSize: 25, color: Colors.black87),
            ),
            Text(getTotalPrice),
            SizedBox(
              height: 50,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market Store"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardTemplate(
                    bronzeCard, Colors.brown[300], bronzeCard.getTotalPrice()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardTemplate(
                    SilverCard, Colors.grey, silverCard.getTotalPrice())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardTemplate(
                    GoldCard, Color(0xffFFD700), goldCard.getTotalPrice())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
