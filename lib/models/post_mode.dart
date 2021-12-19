
class Creatpost {
  late String name;
  late String phone;
  late String datetime;
  late String location;
  late String uid;

  Creatpost({
    required this.datetime,
    required this.location,
    required this.name,
    required this.phone,
    required this.uid,
  });

  Creatpost.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    datetime = json['datetime'];
    location = json['location'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'uid': uid,
      'location': location,
      'datetime': datetime,

    };
  }
}
