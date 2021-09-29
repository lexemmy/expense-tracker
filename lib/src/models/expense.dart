// To parse this JSON data, do
//
//     final expense = expenseFromJson(jsonString);

import 'dart:convert';

List<Expense> expenseFromJson(String str) => List<Expense>.from(json.decode(str).map((x) => Expense.fromJson(x)));

String expenseToJson(List<Expense> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expense {
    Expense({
        this.category,
        this.amount,
        this.type,
    });

    String category;
    int amount;
    String type;

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        category: json["category"],
        amount: json["amount"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "amount": amount,
        "type": type,
    };
}
