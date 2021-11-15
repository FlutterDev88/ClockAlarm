class ModelAlarm {
  int?      id;
  String?   title;
  DateTime? alarmDateTime;
  bool?     isPending;
  int?      gradientColorIndex;


  ModelAlarm({
    this.id,
    this.title,
    this.alarmDateTime,
    this.isPending,
    this.gradientColorIndex,
  });


  factory ModelAlarm.fromMap(Map<String, dynamic> json) => ModelAlarm(
    id: json["id"],
    title: json["title"],
    alarmDateTime: DateTime.parse(json["alarmDateTime"]),
    isPending: json["isPending"],
    gradientColorIndex: json["gradientColorIndex"],
  );


  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "alarmDateTime": alarmDateTime?.toIso8601String() ?? '',
    "isPending": isPending,
    "gradientColorIndex": gradientColorIndex,
  };
}
