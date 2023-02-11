class Donation {
  String? name;
  String? amount;
  String? id;
  String? number;

  Donation({this.name, this.amount, this.id, this.number});

  Map<String, dynamic> tomap() => {
        'name': name,
        'amount': amount,
        'id': id,
        'number': number,
      };
}