class Transaction{
  String name,date,image,amount;

  Transaction(this.name, this.date, this.image,this.amount);
}


List<Transaction>transactiond = transactiondata.map((e) => Transaction(
  e['name'],
  e['date'],
  e['image'],
  e['amount'],
),
).toList();
var transactiondata = [

  {
    "name": "Amazon Purchase",
    "date": "19th March,2021",
    "image" : "images/amazon.png",
    "amount": "-4458.00"

  },
  {
    "name": "Amazon Reversal",
    "date": "12th March,2021",
    "image" : "images/amazon.png",
    "amount": "+4458.00"

  },
  {
    "name": "Coolwings",
    "date": "12th March,2021",
    "image" : "images/coolwings.png",
    "amount": "-1489.45"

  },
  {
    "name": "Flipkart Online",
    "date": "05th Feb,2021",
    "image" : "images/flipkart.png",
    "amount": "-748,23"

  },
  {
    "name": "Wow Momo,Kolkata",
    "date": "11th Dec,2020",
    "image" : "images/Wow_momo.jpg",
    "amount" : "-120.25"

  },
  {
    "name": "Ola Cab",
    "date": "12th Nov,2020",
    "image" : "images/ola.jpg",
    "amount": "-330.00"

  },
  {
    "name": "Grofers Reversal",
    "date": "10th Oct,2020",
    "image" : "images/groffers.jpg",
    "amount": "+330.00"

  },

];