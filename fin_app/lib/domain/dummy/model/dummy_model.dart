// ignore_for_file: public_member_api_docs, sort_constructors_first

class DummyModel {
  final String id;
  final String name;
  final int age;
  final String city;

  DummyModel({
    required this.id,
    required this.city,
    required this.age,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'city': city,
    };
  }

  factory DummyModel.fromMap(Map<String, dynamic> map) {
    return DummyModel(
      id: map['id'] as String,
      name: map['name'] as String,
      age: map['age'] as int,
      city: map['city'] as String,
    );
  }
}
