import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDTO {
  User user;
  Token token;

  UserDTO({this.user, this.token});

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String address;
  final String country;
  final String city;
  @JsonKey(includeIfNull: false)
  final String username;
  final String role;
  @JsonKey(includeIfNull: false)
  final String email;
  final String avatar;
  final String phone;
  final BankDetails bankDetail;
  @JsonKey(includeIfNull: false)
  final String password;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.country,
        this.city,
        this.username,
        this.role,
        this.email,
        this.avatar,
        this.phone,
        this.bankDetail,
        this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Token {
  final int expiresIn;
  String accessToken;

  Token({this.expiresIn, this.accessToken});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class BankDetails {
  final String bankName;
  final String accountNo;
  final String routingNo;

  BankDetails({this.bankName, this.accountNo, this.routingNo});

  factory BankDetails.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}
