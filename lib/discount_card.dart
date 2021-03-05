// void main() {
//   GoldCard goldCard = GoldCard(turnover: 1500.0, purchaseValue: 1300.0);
//   SilverCard silverCard = SilverCard(turnover: 600.0, purchaseValue: 850.0);
//   BronzeCard bronzeCard = BronzeCard(turnover: 0.0, purchaseValue: 150);

//   print(bronzeCard.getTotalPrice());
//   print("\n");
//   print(silverCard.getTotalPrice());
//   print("\n");
//   print(goldCard.getTotalPrice());
// }

class User {
  final int id;
  final String name;
  const User({this.id = 1, this.name = "Name"});
}

abstract class DiscountCard {
  User owner;
  double turnover;
  double purchaseValue;
  double discountRate;

  DiscountCard(
      {this.owner, this.turnover, this.discountRate, this.purchaseValue});

  String getTotalPrice();
}

class BronzeCard extends DiscountCard {
  BronzeCard(
      {double turnover,
      double discountRate = 0.0,
      double purchaseValue,
      User owner})
      : super(
          turnover: turnover,
          discountRate: discountRate,
          purchaseValue: purchaseValue,
          owner: owner,
        );

  @override
  String getTotalPrice() {
    if (turnover >= 100 && turnover <= 300) {
      discountRate = 0.01;
      return "Purchase price is: $purchaseValue\nDicount rate: ${double.parse((discountRate * 100).toStringAsFixed(2))}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
    }
    if (turnover > 300) {
      discountRate = 0.035;
      return "Purchase price is: $purchaseValue\nDicount rate: ${double.parse((discountRate * 100).toStringAsFixed(2))}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
    }
    return "Purchase price is: $purchaseValue\nDicount rate: ${double.parse((discountRate * 100).toStringAsFixed(2))}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
  }
}

class SilverCard extends DiscountCard {
  SilverCard(
      {double turnover,
      double discountRate = 0.02,
      double purchaseValue,
      User owner})
      : super(
          turnover: turnover,
          discountRate: discountRate,
          purchaseValue: purchaseValue,
          owner: owner,
        );

  @override
  String getTotalPrice() {
    if (turnover > 300) {
      discountRate = 0.035;
      return "Purchase price is: $purchaseValue\nDicount rate: ${double.parse((discountRate * 100).toStringAsFixed(2))}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
    } else {
      return "Purchase price is: $purchaseValue\nDicount rate: ${discountRate * 100.0}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
    }
  }
}

class GoldCard extends DiscountCard {
  GoldCard(
      {double turnover,
      double discountRate = 0.02,
      double purchaseValue,
      User owner})
      : super(
          turnover: turnover,
          discountRate: discountRate,
          purchaseValue: purchaseValue,
          owner: owner,
        );

  @override
  String getTotalPrice() {
    if (turnover == 0.0) {
      return "Purchase price is: $purchaseValue\nDicount rate: ${discountRate * 100.0}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
    } else {
      int numberOfHundreds = turnover ~/ 100;
      discountRate += numberOfHundreds / 100;
      if (discountRate > 0.1) {
        discountRate = 0.1;
      }
      return "Purchase price is: $purchaseValue\nDicount rate: ${discountRate * 100.0}%\nDisount: ${purchaseValue * discountRate}\nTotal:${purchaseValue - (purchaseValue * discountRate)}";
    }
  }
}
