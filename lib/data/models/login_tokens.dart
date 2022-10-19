import 'package:json_annotation/json_annotation.dart';

part 'login_tokens.g.dart';

@JsonSerializable()
class LoginTokens {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  LoginTokens({
    required this.accessToken,
    required this.refreshToken,});

  factory LoginTokens.fromJson(Map<String, dynamic> json) => _$LoginTokensFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTokensToJson(this);
}
