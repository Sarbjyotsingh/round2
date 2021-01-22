import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round2/UI/custom_selector.dart';
import 'package:round2/UI/widgets/custom_flat_button.dart';
import 'package:round2/UI/widgets/custom_text_field.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController fullNameTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: 'Country',
                  textEditingController: countryTextEditingController,
                  isDisabledFocusNode: true,
                  onTap: () async {
                    var countryName = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomSelector(
                        list: List.generate(
                            10, (index) => 'Country ${index + 1}'),
                        listName: 'Country List',
                        title: 'Select Your Country',
                      );
                    }));
                    if (countryName != null) {
                      countryTextEditingController.text = countryName;
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please select the country';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  textEditingController: fullNameTextEditingController,
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                // TextField(),
                Spacer(
                  flex: 2,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomFlatButton(
                    buttonText: 'Registor',
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Your Name is ${fullNameTextEditingController.text} and Your Country is ${countryTextEditingController.text}',
                              style: TextStyle(fontSize: 5),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
