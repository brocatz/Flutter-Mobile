class CreditCardModel {
  String cardholdername;
  String cardNumber;
  String cvv;
  String expireDate;

  CreditCardModel(
      {this.cardholdername = '',
      this.cardNumber = '',
      this.cvv = '',
      this.expireDate = ''});
}
