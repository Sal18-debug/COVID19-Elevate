class User {
  String id;
  String name;
  String email;
  String password;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  User.fromMap(Map<String, dynamic> map) {
    this.id = map["_id"];
    this.name = map["name"];
    this.email = map["email"];
    this.password = map["password"];
  }

  toJson() {
    return {
      "_id": this.id,
      "name": this.name,
      "email": this.email,
      "password": this.password,
    };
  }
}
