import 'dart:convert';

class ContentModel {
  ContentModel(
    this.id,
    this.content,
    this.criationDate,
    this.updateDate,
  );

  final int id;
  final String content;
  final DateTime criationDate;
  final DateTime? updateDate;

  @override
  String toString() {
    return 'ContentModel(id: $id, content: $content, criationDate: $criationDate, updateDate: $updateDate)';
  }

  ContentModel copyWith({
    int? id,
    String? content,
    DateTime? criationDate,
    DateTime? updateDate,
  }) {
    return ContentModel(
      id ?? this.id,
      content ?? this.content,
      criationDate ?? this.criationDate,
      updateDate ?? this.updateDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'criationDate': criationDate.millisecondsSinceEpoch,
      'updateDate': updateDate?.millisecondsSinceEpoch,
    };
  }

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      int.parse(map['id']),
      map['content'] as String,
      DateTime.fromMillisecondsSinceEpoch(int.parse(map['criationDate'])),
      map['updateDate'] != null ? DateTime.fromMillisecondsSinceEpoch(int.parse(map['updateDate'])) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentModel.fromJson(String source) => ContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContentModel && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
