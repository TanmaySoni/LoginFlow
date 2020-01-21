class User {
  int age;
  bool profileCompleted;
  String userName;
  String email;
  String phoneNumber;
  String gender;
  String dob;
  String id;
  String profilePic;
  List<String> loginMethods;

  User({
    this.age,
    this.email,
    this.phoneNumber,
    this.userName,
    this.gender,
    this.loginMethods,
    this.profileCompleted,
    this.dob,
    this.id,
    this.profilePic,
  });

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    age = json['age'];
    gender = json['gender'];
    loginMethods = json['loginMethods'];
    profileCompleted = json['profileCompleted'];
    dob = json['dob'];
    id = json['id'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['loginMethods'] = this.loginMethods;
    data['profileCompleted'] = this.profileCompleted;
    data['dob'] = this.dob;
    data['id'] = this.id;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
