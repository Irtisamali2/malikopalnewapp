// To parse this JSON data, do
//
//     final newCapitalHistoryResponse = newCapitalHistoryResponseFromJson(jsonString);

import 'dart:convert';

NewCapitalHistoryResponseModel newCapitalHistoryResponseModelFromJson(String str) =>
    NewCapitalHistoryResponseModel.fromJson(json.decode(str));

String newCapitalHistoryResponseModelToJson(NewCapitalHistoryResponseModel data) =>
    json.encode(data.toJson());

class NewCapitalHistoryResponseModel {
  NewCapitalHistoryResponseModel({
    this.data,
    this.message,
    this.errorList,
  });

  List<DatumModel>? data;
  dynamic message;
  List<dynamic>? errorList;

  factory NewCapitalHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      NewCapitalHistoryResponseModel(
        data: json["Data"] == null
            ? null
            : List<DatumModel>.from(json["Data"].map((x) => DatumModel.fromJson(x))),
        message: json["Message"],
        errorList: json["ErrorList"] == null
            ? null
            : List<dynamic>.from(json["ErrorList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Message": message,
        "ErrorList": errorList == null
            ? null
            : List<dynamic>.from(errorList!.map((x) => x)),
      };
}

class DatumModel {
  DatumModel({
    this.totalCapitalAmount,
    this.id,
    this.date,
    this.dateStr,
    this.type,
    this.closingMonth,
    this.desc,
    this.debit,
    this.credit,
    this.balance,
    this.fnFDetails,
  });

  num? totalCapitalAmount;
  num? id;
  DateTime? date;
  String? dateStr;
  String? type;
  dynamic closingMonth;
  dynamic desc;
  num? debit;
  num? credit;
  num? balance;
  dynamic fnFDetails;

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        totalCapitalAmount: json["TotalCapitalAmount"] == null
            ? null
            : json["TotalCapitalAmount"],
        id: json["ID"] == null ? null : json["ID"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        dateStr: json["DateStr"] == null ? null : json["DateStr"],
        type: json["Type"] == null ? null : json["Type"],
        closingMonth: json["ClosingMonth"],
        desc: json["Desc"],
        debit: json["Debit"] == null ? null : json["Debit"],
        credit: json["Credit"] == null ? null : json["Credit"],
        balance: json["Balance"] == null ? null : json["Balance"],
        fnFDetails: json["FnFDetails"],
      );

  Map<String, dynamic> toJson() => {
        "TotalCapitalAmount":
            totalCapitalAmount == null ? null : totalCapitalAmount,
        "ID": id == null ? null : id,
        "Date": date == null ? null : date?.toIso8601String(),
        "DateStr": dateStr == null ? null : dateStr,
        "Type": type == null ? null : type,
        "ClosingMonth": closingMonth,
        "Desc": desc,
        "Debit": debit == null ? null : debit,
        "Credit": credit == null ? null : credit,
        "Balance": balance == null ? null : balance,
        "FnFDetails": fnFDetails,
      };
}
