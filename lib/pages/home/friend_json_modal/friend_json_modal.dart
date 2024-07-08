import 'datum.dart';

class FriendJsonModal {
  List<Datum>? data;
  int? errorCode;
  String? errorMsg;

  FriendJsonModal({this.data, this.errorCode, this.errorMsg});

  factory FriendJsonModal.fromJson(Map<String, dynamic> json) {
    return FriendJsonModal(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorCode: json['errorCode'] as int?,
      errorMsg: json['errorMsg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'errorCode': errorCode,
        'errorMsg': errorMsg,
      };
}
