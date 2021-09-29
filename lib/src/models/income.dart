// To parse this JSON data, do
//
//     final income = incomeFromJson(jsonString);

import 'dart:convert';

List<Income> incomeFromJson(String str) => List<Income>.from(json.decode(str).map((x) => Income.fromJson(x)));

String incomeToJson(List<Income> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Income {
    Income({
        this.category,
        this.type,
        this.amount,
    });

    String category;
    String type;
    int amount;

    factory Income.fromJson(Map<String, dynamic> json) => Income(
        category: json["category"],
        type: json["type"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "amount": amount,
    };
}
