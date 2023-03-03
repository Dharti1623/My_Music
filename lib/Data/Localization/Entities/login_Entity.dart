import 'package:isar/isar.dart';

part 'login_Entity.g.dart';

@Collection()
class LoginEntities{
  Id id = Isar.autoIncrement;
  late String userEmail;
  late String userToken;
}
