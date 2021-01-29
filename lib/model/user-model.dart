class UserModel {
  String token;
  String name;
  String phone;

  UserModel({this.token, this.name, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
