import 'package:e_commerce_app_flutter/constants.dart';
import 'package:e_commerce_app_flutter/models/Info.dart';
import 'package:e_commerce_app_flutter/services/database/user_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class infoBox extends StatelessWidget {
  const infoBox({
    Key key,
    @required this.infoId,
  }) : super(key: key);

  final String infoId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FutureBuilder<Info>(
                  future: UserDatabaseHelper().getInfoFromId(infoId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final info = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${info.nickname}",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${info.name}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${info.addressLine1}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${info.addressLine2}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "City: ${info.city}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Email: ${info.email}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "PIN: ${info.pincode}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Phone: ${info.phone}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      final error = snapshot.error.toString();
                      Logger().e(error);
                    }
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: kTextColor,
                        size: 60,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
