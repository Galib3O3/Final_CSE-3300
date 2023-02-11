import 'package:get/get_connect/http/src/utils/utils.dart';

class DonationFunc {
  String? name;
  String? email;
  String? password;
  String? number;
  String? amount;
  String? transiction_id;

  DonationFunc(
      {this.name,
      this.email,
      this.password,
      this.number,
      this.amount,
      this.transiction_id});
//data fetch server
  factory DonationFunc.fromMap(map) {
    return DonationFunc(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      number: map['number'],
      amount: map['amount'],
      transiction_id: map['transiction_id'],
    );
  }
  //data pass server

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'number': number,
      'amount': amount,
      'transication_id': transiction_id,
    };
  }
}
