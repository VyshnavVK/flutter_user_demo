class UserDetailsModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetailsModel(
      {required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}