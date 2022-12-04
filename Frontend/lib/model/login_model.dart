class Login_model {
  int? id;
  int? cpr;
  String? name;
  String? email;
  String? password;
  String? role;
  String? createdAt;
  String? updatedAt;

  Login_model(
      {this.id,
      this.cpr,
      this.name,
      this.email,
      this.password,
      this.role,
      this.createdAt,
      this.updatedAt});

  Login_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpr = json['cpr'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cpr'] = this.cpr;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
