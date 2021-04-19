class Datas {


  String details, image;


  Datas(this.details, this.image);

}

  List<Datas>datas = datadetails.map((e) => Datas(
    e['details'],
    e['image'],
  ),
  ).toList();


var datadetails = [
  {
    "details":"Money Transfer",
    "image": "images/transfer.svg"
  },
  {
    "details":"Withdrawal",
    "image": "images/moneywithdrawal.svg"
  },
  {
    "details":"Check",
    "image": "images/check.svg"
  },


];