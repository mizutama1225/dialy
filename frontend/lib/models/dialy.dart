class Dialy {
  Dialy({
    required this.userName,
    required this.dialyText,
  });
  final String dialyText;
  final String userName;
}

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> Json) {
    return LoginResponseModel(token: json["token"] != null ? json["token"]: "", error: json["error"] != null ? json["error"]: "",)
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginResponseModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email.trim(),
      'passward': password.trim(),
    };

    return map;
  }
}