import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_flutter/components/default_button.dart';
import 'package:e_commerce_app_flutter/models/Info.dart';
import 'package:e_commerce_app_flutter/services/database/user_database_helper.dart';
import 'package:e_commerce_app_flutter/size_config.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:string_validator/string_validator.dart';
import '../../../constants.dart';

class InfoDetailsForm extends StatefulWidget {
  final Info infoToEdit;
  InfoDetailsForm({
    Key key,
    this.infoToEdit,
  }) : super(key: key);

  @override
  _InfoDetailsFormState createState() => _InfoDetailsFormState();
}

class _InfoDetailsFormState extends State<InfoDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nicknameFieldController = TextEditingController();

  final TextEditingController nameFieldController = TextEditingController();

  final TextEditingController addressLine1FieldController =
      TextEditingController();

  final TextEditingController addressLine2FieldController =
      TextEditingController();

  final TextEditingController cityFieldController = TextEditingController();

  final TextEditingController emailFieldController = TextEditingController();

  final TextEditingController pincodeFieldController = TextEditingController();

  final TextEditingController phoneFieldController = TextEditingController();

  @override
  void dispose() {
    nicknameFieldController.dispose();
    nameFieldController.dispose();
    addressLine1FieldController.dispose();
    addressLine2FieldController.dispose();
    cityFieldController.dispose();
    emailFieldController.dispose();
    pincodeFieldController.dispose();
    phoneFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          buildNicknameField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNameField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressLine1Field(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressLine2Field(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCityField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPincodeField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Save Information",
            press: widget.infoToEdit == null
                ? saveNewInfoButtonCallback
                : saveEditedInfoButtonCallback,
          ),
        ],
      ),
    );
    if (widget.infoToEdit != null) {
      nicknameFieldController.text = widget.infoToEdit.nickname;
      nameFieldController.text = widget.infoToEdit.name;
      addressLine1FieldController.text = widget.infoToEdit.addressLine1;
      addressLine2FieldController.text = widget.infoToEdit.addressLine2;
      cityFieldController.text = widget.infoToEdit.city;
      emailFieldController.text = widget.infoToEdit.email;
      pincodeFieldController.text = widget.infoToEdit.pincode;
      phoneFieldController.text = widget.infoToEdit.phone;
    }
    return form;
  }

  Widget buildNicknameField() {
    return TextFormField(
      controller: nicknameFieldController,
      keyboardType: TextInputType.name,
      maxLength: 8,
      decoration: InputDecoration(
        hintText: "Enter your nickname",
        labelText: "Your Nickname",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (nicknameFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildNameField() {
    return TextFormField(
      controller: nameFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter Full Name",
        labelText: "Your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (nameFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAddressLine1Field() {
    return TextFormField(
      controller: addressLine1FieldController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        hintText: "Enter Address Line No. 1",
        labelText: "Address Line 1",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (addressLine1FieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAddressLine2Field() {
    return TextFormField(
      controller: addressLine2FieldController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        hintText: "Enter Address Line No. 2",
        labelText: "Address Line 2",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (addressLine2FieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildCityField() {
    return TextFormField(
      controller: cityFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter City",
        labelText: "City",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (cityFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      controller: emailFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter Email",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (emailFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildPincodeField() {
    return TextFormField(
      controller: pincodeFieldController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Enter PINCODE",
        labelText: "PINCODE",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (pincodeFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        } else if (!isNumeric(pincodeFieldController.text)) {
          return "Only digits field";
        } else if (pincodeFieldController.text.length != 6) {
          return "PINCODE must be of 6 Digits only";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildPhoneField() {
    return TextFormField(
      controller: phoneFieldController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Enter Phone Number",
        labelText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (phoneFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        } else if (phoneFieldController.text.length != 10) {
          return "Only 10 Digits";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> saveNewInfoButtonCallback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final Info newInfo = generateInfoObject();
      bool status = false;
      String snackbarMessage;
      try {
        status =
            await UserDatabaseHelper().addInfoForCurrentUser(newInfo);
        if (status == true) {
          snackbarMessage = "Information saved successfully";
        } else {
          throw "Coundn't save the information due to unknown reason";
        }
      } on FirebaseException catch (e) {
        Logger().w("Firebase Exception: $e");
        snackbarMessage = "Something went wrong";
      } catch (e) {
        Logger().w("Unknown Exception: $e");
        snackbarMessage = "Something went wrong";
      } finally {
        Logger().i(snackbarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage),
          ),
        );
      }
    }
  }

  Future<void> saveEditedInfoButtonCallback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final Info newInfo =
          generateInfoObject(id: widget.infoToEdit.id);

      bool status = false;
      String snackbarMessage;
      try {
        status =
            await UserDatabaseHelper().updateInfoForCurrentUser(newInfo);
        if (status == true) {
          snackbarMessage = "Information updated successfully";
        } else {
          throw "Couldn't update information due to unknown reason";
        }
      } on FirebaseException catch (e) {
        Logger().w("Firebase Exception: $e");
        snackbarMessage = "Something went wrong";
      } catch (e) {
        Logger().w("Unknown Exception: $e");
        snackbarMessage = "Something went wrong";
      } finally {
        Logger().i(snackbarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage),
          ),
        );
      }
    }
  }

  Info generateInfoObject({String id}) {
    return Info(
      id: id,
      nickname: nicknameFieldController.text,
      name: nameFieldController.text,
      addressLine1: addressLine1FieldController.text,
      addressLine2: addressLine2FieldController.text,
      city: cityFieldController.text,
      email: emailFieldController.text,
      pincode: pincodeFieldController.text,
      phone: phoneFieldController.text,
    );
  }
}
