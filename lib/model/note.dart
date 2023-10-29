import 'package:hive/hive.dart';


 part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final int color;
  @HiveField(3)
  final String date;

  Note({
    required this.title,
    required this.subTitle,
    required this.color,
    required this.date,
  });
}
