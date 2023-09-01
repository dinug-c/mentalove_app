// import 'package:flutter/material.dart';

class History {
  // AssetImage faceEmoji;
  String title;
  String date;
  String text;

  History ({
    // required this.faceEmoji,
    required this.title,
    required this.date,
    required this.text
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      // faceEmoji: json['\$faceemoji'],
      title: json['title'],
      date: json['date'],
      text: json['text']
    );
  }
}