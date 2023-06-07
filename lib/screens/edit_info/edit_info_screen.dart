import 'package:flutter/material.dart';

import 'components/body.dart';

class EditInfoScreen extends StatelessWidget {
  final String infoIdToEdit;

  const EditInfoScreen({Key key, this.infoIdToEdit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(infoIdToEdit: infoIdToEdit),
    );
  }
}
