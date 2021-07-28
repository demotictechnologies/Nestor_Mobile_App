// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return UserDTO(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] == null
        ? null
        : Token.fromJson(json['token'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
  'user': instance.user?.toJson(),
  'token': instance.token?.toJson(),
};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    address: json['address'] as String,
    country: json['country'] as String,
    city: json['city'] as String,
    username: json['username'] as String,
    role: json['role'] as String,
    email: json['email'] as String,
    avatar: json['avatar'] as String,
    phone: json['phone'] as String,
    bankDetail: json['bankDetail'] == null
        ? null
        : BankDetails.fromJson(json['bankDetail'] as Map<String, dynamic>),
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
    'lastName': instance.lastName,
    'address': instance.address,
    'country': instance.country,
    'city': instance.city,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  val['role'] = instance.role;
  writeNotNull('email', instance.email);
  val['avatar'] = instance.avatar;
  val['phone'] = instance.phone;
  val['bankDetail'] = instance.bankDetail?.toJson();
  writeNotNull('password', instance.password);
  return val;
}

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    expiresIn: json['expiresIn'] as int,
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
  'expiresIn': instance.expiresIn,
  'accessToken': instance.accessToken,
};

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) {
  return BankDetails(
    bankName: json['bankName'] as String,
    accountNo: json['accountNo'] as String,
    routingNo: json['routingNo'] as String,
  );
}

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'accountNo': instance.accountNo,
      'routingNo': instance.routingNo,
    };
