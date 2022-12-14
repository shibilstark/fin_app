import 'package:fin_app/domain/dummy/model/dummy_model.dart';
import 'package:uuid/uuid.dart';

final dummyDatas = List.generate(
    25,
    (index) => DummyModel(
        id: Uuid().v4(),
        city: cities[index],
        age: 25 + index,
        name: names[index]));

final cities = [
  'Kochi',
  'Trivandrum',
  'Chennai',
  'Pune',
  'Mumbai',
  'Delhi',
  'Banglore',
  'Hyderabad',
  'Kashmir',
  'Surat',
  'Ahmedabad',
  'Haryana',
  'Patna',
  'Kolkata',
  'Amrtsar',
  'Mohali',
  'Mysore',
  'Calicut',
  'Goa',
  'Jaipur',
  'Rajastan',
  'Nagaland',
  'Manipal',
  'Gurgaun',
  'Telangana',
];
final names = [
  'Muhammed',
  'Ram',
  'Sing',
  'Yuvraj',
  'Tony',
  'Steve',
  'Shahrukh',
  'Salman',
  'Deepthi',
  'Arpana',
  'Nithya',
  'Mohan',
  'George',
  'Revi',
  'Cooper',
  'Leo',
  'Marcelo',
  'Arun',
  'Ajay',
  'Alan',
  'Veer',
  'Shahid',
  'Imran',
  'Kumar',
  'Aparna',
];
