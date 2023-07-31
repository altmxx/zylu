// ignore_for_file: public_member_api_docs, sort_constructors_first
class Car {
  String name;
  int mileage;
  int age;
  Car({
    required this.name,
    required this.mileage,
    required this.age,
  });

  factory Car.fromJson(json) {
    return Car(
      name: json['name'],
      mileage: json['mileage'],
      age: json['age'],
    );
  }
}
