class Users {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? address;
  String? createdAt;
  String? imageURL;
  Users({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.address,
    this.createdAt,
    this.imageURL,
  });
  Users.fromJson(map) {
// ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    password = map['password'];
    address = map['address'];
    createdAt = map['createdAt'];
    imageURL = map['imageURL'];
  }
  toJson() {
    return {
      'userId': userId,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'address': address,
      'createdAt': createdAt,
      'imageURL': imageURL,
    };
  }
}
