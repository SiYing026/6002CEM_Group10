import 'package:e_commerce_app_flutter/services/data_streams/data_stream.dart';
import 'package:e_commerce_app_flutter/services/database/user_database_helper.dart';

class InfoStream extends DataStream<List<String>> {
  @override
  void reload() {
    final infoList = UserDatabaseHelper().infoList;
    infoList.then((list) {
      addData(list);
    }).catchError((e) {
      addError(e);
    });
  }
}
