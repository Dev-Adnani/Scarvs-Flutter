class UserDetails {
  UserDetails({
    required this.received,
    required this.filled,
    required this.data,
  });
  late final bool received;
  late final bool filled;
  late final Data data;

  UserDetails.fromJson(Map<String, dynamic> json) {
    received = json['received'];
    filled = json['filled'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['received'] = received;
    _data['filled'] = filled;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userAddress,
    required this.userPhoneNo,
    required this.user,
  });
  late final int id;
  late final String userAddress;
  late final String userPhoneNo;
  late final User user;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userAddress = json['user_address'];
    userPhoneNo = json['user_phone_no'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_address'] = userAddress;
    _data['user_phone_no'] = userPhoneNo;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.useremail,
    required this.userpassword,
  });
  late final int id;
  late final String username;
  late final String useremail;
  late final String userpassword;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    useremail = json['useremail'];
    userpassword = json['userpassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['useremail'] = useremail;
    _data['userpassword'] = userpassword;
    return _data;
  }
}
