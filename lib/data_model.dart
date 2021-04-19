class Datas {


  String details, simage,uimage;


  Datas(this.details, this.simage,this.uimage);

}

  List<Datas>datas = datadetails.map((e) => Datas(
    e['details'],
    e['simage'],
    e['uimage']
  ),
  ).toList();


var datadetails = [
  {
    "details":"Money Transfer",
    "simage": "images/transactionselected.svg",
    "uimage": "images/transactionunselected.svg"
  },
  {
    "details":"Withdrawal",
    "simage": "images/withdrawselected.svg",
    "uimage": "images/withdrawunselected.svg"
  },
  {
    "details":"Check",
    "simage": "images/checkselected.svg",
    "uimage":"images/checkunselected.svg"
  },


];