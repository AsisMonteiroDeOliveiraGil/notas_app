import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Nota {
  String id;
  final String texto;

  Nota({required this.texto}) : id = uuid.v4();
}
