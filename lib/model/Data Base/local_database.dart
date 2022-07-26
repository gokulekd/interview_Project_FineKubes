import 'package:hive/hive.dart';
 part 'local_database.g.dart';


@HiveType(typeId: 1)

class Database extends HiveObject {
  @HiveField(0)
  String api;
  @HiveField(1)
  String description;
  @HiveField(2)
  String auth;
  @HiveField(3)
  String http;
  @HiveField(4)
  String cors;
  @HiveField(5)
  String link;
  @HiveField(6)
  String category;


  Database(
      {required this.api,
      required this.description,
      required this.auth,
      required this.http,
      required this.cors,
      required this.link,
      required this.category});


}
