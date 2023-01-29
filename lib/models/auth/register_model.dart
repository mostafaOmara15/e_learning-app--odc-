class RegisterModel {
  String? code;
  String? message;
  List<UserData> userDataList = [];

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element) {
      UserData item = UserData.fromJson(json: element);
      userDataList.add(item);
    });
  }
}

class UserData {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;

  UserData.fromJson({required Map<String, dynamic> json}) {
    name = json['data'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
  }
}
