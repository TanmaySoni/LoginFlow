import 'package:flutter/material.dart';
import 'package:login_flow/model/signup_model.dart';
import 'package:login_flow/services/screen_ratio.dart';
import 'package:login_flow/services/validation.dart';
import 'package:login_flow/ui/components/button.dart';
import 'package:login_flow/ui/components/textfield.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:login_flow/utils/constants.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Validators validator = Validators();
  SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Consumer<SignUpModel>(
        builder: (_, signupModel, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text("Sign Up"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  SizeConfig.getWidthRatio(20),
                  SizeConfig.getHeightRatio(40),
                  SizeConfig.getWidthRatio(20),
                  SizeConfig.getHeightRatio(40),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        labelText: "Email",
                        validatorFunction: validator.validateEmail,
                        onSaved: (value) {
                          signupModel.setEmail(value);
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.getHeightRatio(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CountryCodePicker(
                            onChanged: (value) {
                              Constants.countryCode = value;
                            },
                            onInit: (value) {
                              Constants.countryCode = value;
                            },
                            initialSelection: '+91',
                            favorite: ['+91'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          Flexible(
                            child: CustomTextField(
                              labelText: "Phone Number",
                              validatorFunction: (value) {
                                validator.validateMobileNumber(
                                    "${Constants.countryCode}" + "$value");
                              },
                              onSaved: (value) {
                                signupModel.setPhoneNumber(
                                    "${Constants.countryCode}" + "$value");
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.getHeightRatio(20),
                      ),
                      CustomTextField(
                        labelText: "Password",
                        obscureText: true,
                        validatorFunction: validator.validatePassword,
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: SizeConfig.getHeightRatio(20),
                      ),
                      CustomTextField(
                        labelText: "Confirm Password",
                        obscureText: true,
                        validatorFunction: validator.validatePassword,
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: SizeConfig.getHeightRatio(20),
                      ),
                      CustomButton(
                        height: SizeConfig.getHeightRatio(60),
                        buttonText: "Sign Up",
                        textColor: Colors.white,
                        showLoader: signupModel.buttonLoader,
                        bgColor: Theme.of(context).primaryColor,
                        onTapFunction: () {
                          if (_formKey.currentState.validate()) {
                            signupModel.setButtonLoader(true);
                            _formKey.currentState.save();
                          }
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.getHeightRatio(20),
                        child: Center(
                          child: Text("or"),
                        ),
                      ),
                      CustomButton(
                        height: SizeConfig.getHeightRatio(60),
                        buttonText: "Login with Facebook",
                        textColor: Colors.white,
                        bgColor: Constants.fbColor,
                        onTapFunction: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
