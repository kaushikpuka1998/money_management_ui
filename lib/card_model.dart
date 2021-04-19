class Carddetails{

  String user,cardNumber,cardexpire,cardtype;
  int cardbackground;

  Carddetails(this.user, this.cardNumber, this.cardexpire, this.cardtype,
      this.cardbackground);

}

List<Carddetails>cards = cardData.map((e) => Carddetails(
  e['user'],
  e['cardNumber'],
  e['cardexpire'],
  e['cardtype'],
  e['cardbackground'],
  ),
).toList();


var cardData = [
  {
    "user": "Kaushik Ghosh",
    "cardNumber": "**** **** **** 5412",
    "cardexpire": "05/23",
    "cardtype": "images/visa.png",
    "cardbackground": 0xFF1E1E99,

  }
  ,

  {
    "user": "Kaushik Ghosh",
    "cardNumber": "**** **** **** 9785",
    "cardexpire": "07/22",
    "cardtype": "images/mastercard.png",
    "cardbackground": 0xFFFF1897,

  },

  {
    "user": "Kaushik Ghosh",
    "cardNumber": "**** **** **** 2478",
    "cardexpire": "11/25",
    "cardtype": "images/visa.png",
    "cardbackground": 0xFFFF70A3,

  }
];