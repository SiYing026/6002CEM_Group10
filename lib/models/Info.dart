import 'Model.dart';

class Info extends Model {
  static const String NICKNAME_KEY = "nickname";
  static const String ADDRESS_LINE_1_KEY = "address_line_1";
  static const String ADDRESS_LINE_2_KEY = "address_line_2";
  static const String CITY_KEY = "city";
  static const String EMAIL_KEY = "email";
  static const String PINCODE_KEY = "pincode";
  static const String NAME_KEY = "name";
  static const String PHONE_KEY = "phone";

  String nickname;
  String name;

  String addressLine1;
  String addressLine2;
  String city;
  String email;
  String pincode;
  String phone;

  Info({
    String id,
    this.nickname,
    this.name,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.email,
    this.pincode,
    this.phone,
  }) : super(id);

  factory Info.fromMap(Map<String, dynamic> map, {String id}) {
    return Info(
      id: id,
      nickname: map[NICKNAME_KEY],
      name: map[NAME_KEY],
      addressLine1: map[ADDRESS_LINE_1_KEY],
      addressLine2: map[ADDRESS_LINE_2_KEY],
      city: map[CITY_KEY],
      email: map[EMAIL_KEY],
      pincode: map[PINCODE_KEY],
      phone: map[PHONE_KEY],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      NICKNAME_KEY: nickname,
      NAME_KEY: name,
      ADDRESS_LINE_1_KEY: addressLine1,
      ADDRESS_LINE_2_KEY: addressLine2,
      CITY_KEY: city,
      EMAIL_KEY: email,
      PINCODE_KEY: pincode,
      PHONE_KEY: phone,
    };

    return map;
  }

  @override
  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    if (nickname != null) map[NICKNAME_KEY] = nickname;
    if (name != null) map[NAME_KEY] = name;
    if (addressLine1 != null) map[ADDRESS_LINE_1_KEY] = addressLine1;
    if (addressLine2 != null) map[ADDRESS_LINE_2_KEY] = addressLine2;
    if (city != null) map[CITY_KEY] = city;
    if (email != null) map[EMAIL_KEY] = email;
    if (pincode != null) map[PINCODE_KEY] = pincode;
    if (phone != null) map[PHONE_KEY] = phone;
    return map;
  }
}
