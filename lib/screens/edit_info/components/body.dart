import 'package:e_commerce_app_flutter/constants.dart';
import 'package:e_commerce_app_flutter/models/Info.dart';
import 'package:e_commerce_app_flutter/services/database/user_database_helper.dart';
import 'package:e_commerce_app_flutter/size_config.dart';
import 'package:flutter/material.dart';

import 'info_details_form.dart';

class Body extends StatelessWidget {
  final String infoIdToEdit;

  const Body({Key key, this.infoIdToEdit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(screenPadding)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "Fill Information Details",
                  style: headingStyle,
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                infoIdToEdit == null
                    ? InfoDetailsForm(
                        infoToEdit: null,
                      )
                    : FutureBuilder<Info>(
                        future: UserDatabaseHelper()
                            .getInfoFromId(infoIdToEdit),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final info = snapshot.data;
                            return InfoDetailsForm(infoToEdit: info);
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return InfoDetailsForm(
                            infoToEdit: null,
                          );
                        },
                      ),
                SizedBox(height: getProportionateScreenHeight(40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
