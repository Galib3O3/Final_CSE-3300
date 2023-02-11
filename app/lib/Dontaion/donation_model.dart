class DonationFunc {
  String? name;
  String? number;
  String? amount;
  String? transiction_ID;
  DonationFunc(
      {this.name,
      this.number,
      this.amount,
      this.transiction_ID,});
 factory DonationFunc.fromMap(map) {
    return DonationFunc(
      name: map['name'],
      amount: map['number'],
      number : map['amount'],
      transiction_ID: map['transiction ID'],
    );
  }
  //data pass server

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'amount':amount,
      'transiction ID': transiction_ID,
    };
  }
}
