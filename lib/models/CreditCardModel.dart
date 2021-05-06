///////////////
//  ARCHIVE
////////////////
class CreditCardModel {
  String cardholdername;
  String cardNumber;
  String cvv;
  String expireDate;

  CreditCardModel(
      {this.cardholdername = "",
      this.cardNumber = "",
      this.cvv = "",
      this.expireDate = ""});

  Map<String, dynamic> toJson() => {
        "cardholdername": cardholdername,
        "cardNumber": cardNumber,
        "cvv": cvv,
        "expireDate": expireDate
      };

  CreditCardModel.fromJson(Map<String, dynamic> json)
      : cardholdername = json['cardholdername'],
        cardNumber = json['cardNumber'],
        cvv = json['cvv'],
        expireDate = json['expireDate'];
}
