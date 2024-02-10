
class BoardingPassGraphqlModel {
  final int age;
  final String airport;
  final String arrivalTime;
  final String departureTime;
  final String email;
  final String flight;
  final String id;
  final String lastName;
  final String name;

  BoardingPassGraphqlModel({
    required this.age,
    required this.airport,
    required DateTime arrivalTime,
    required DateTime departureTime,
    required this.email,
    required this.flight,
    required this.id,
    required this.lastName,
    required this.name,
  })  : arrivalTime = arrivalTime.toIso8601String(),
        departureTime = departureTime.toIso8601String();

  Map<String, dynamic> toJson() => {
        'age': age,
        'name': name,
        'airport': airport,
        'arrivalTime': arrivalTime,
        'departureTime': departureTime,
        'email': email,
        'flight': flight,
        'id': id,
        'lastName': lastName
      };
}
