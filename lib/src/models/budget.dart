// To parse this JSON data, do
//
//     final budget = budgetFromJson(jsonString);

import 'dart:convert';

Budget budgetFromJson(String str) => Budget.fromJson(json.decode(str));

String budgetToJson(Budget data) => json.encode(data.toJson());

class Budget {
    Budget({
        this.id,
        this.userId,
        this.startdate,
        this.enddate,
        this.budget,
        this.income,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int userId;
    dynamic startdate;
    dynamic enddate;
    int budget;
    int income;
    DateTime createdAt;
    DateTime updatedAt;

    factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        id: json["id"],
        userId: json["user_id"],
        startdate: json["startdate"],
        enddate: json["enddate"],
        budget: json["budget"],
        income: json["income"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "startdate": startdate,
        "enddate": enddate,
        "budget": budget,
        "income": income,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
