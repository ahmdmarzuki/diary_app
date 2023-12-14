import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DiaryModel {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;

  DiaryModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': DateTime.now(),
    };
  }

  factory DiaryModel.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return DiaryModel(
      id: doc.id,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      createdAt: map['createdAt'].toDate(),
    );
  }

  DiaryModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return DiaryModel(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt);
  }

  factory DiaryModel.empty() {
    return DiaryModel(
        id: '', title: '', content: '', createdAt: DateTime.now());
  }
}
