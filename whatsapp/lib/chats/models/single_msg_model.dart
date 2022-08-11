// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    MessageModel({
        this.isSend,
        this.isReaded,
        this.sendAtt,
        this.message,
    });

    bool? isSend;
    bool? isReaded;
    String? sendAtt;
    String? message;

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        sendAtt: json["sendAtt"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "sendAtt": sendAtt,
        "message": message,
    };
}
