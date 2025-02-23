// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  final double amount;
  final String date;
  final String description;
  Payment({
    required this.amount,
    required this.date,
    required this.description,
  });


  

  Payment copyWith({
    double? amount,
    String? date,
    String? description,
  }) {
    return Payment(
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'date': date,
      'description': description,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      amount: map['amount'] as double,
      date: map['date'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Payment(amount: $amount, date: $date, description: $description)';

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;
  
    return 
      other.amount == amount &&
      other.date == date &&
      other.description == description;
  }

  @override
  int get hashCode => amount.hashCode ^ date.hashCode ^ description.hashCode;
}
