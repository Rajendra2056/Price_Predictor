import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../marketplace/market/main_screen.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;

  var email = "";
  var name = '';
  var password = "";
  var confirmPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Adding userData
  CollectionReference HotelBooking =
      FirebaseFirestore.instance.collection('HotelBooking');

  Future<void> addUser() {
    return HotelBooking.add({'email': email, 'password': password})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);

        await FirebaseFirestore.instance.collection("Hotel").add({
          'email': email,
          'name': name,
          'password': password,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully. Please Login..",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Profile(),
        //   ),
        // );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    } else {
      print("Password and Confirm Password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password and Confirm Password doesn't match",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User SignUp"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen1(
                                animationController: _animationController),
                          ),
                        );

                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            name = nameController.text;
                            password = passwordController.text;
                            confirmPassword = confirmPasswordController.text;
                          });
                          registration();
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account? "),
                    TextButton(
                        onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          Login(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              )
                            },
                        child: Text('Login'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}










































// import 'package:flutter/material.dart';
// import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
// import 'package:flutter_hotel_booking_ui/utils/themes.dart';
// import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
// import 'package:flutter_hotel_booking_ui/modules/login/facebook_twitter_button_view.dart';
// import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
// import 'package:flutter_hotel_booking_ui/utils/validator.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_text_field_view.dart';
// import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   String _errorEmail = '';
//   TextEditingController _emailController = TextEditingController();
//   String _errorPassword = '';
//   TextEditingController _passwordController = TextEditingController();
//   String _errorFName = '';
//   TextEditingController _fnameController = TextEditingController();
//   String _errorLName = '';
//   TextEditingController _lnameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         body: RemoveFocuse(
//           onClick: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               _appBar(),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(top: 32),
//                         child: FacebookTwitterButtonView(),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(
//                           AppLocalizations(context).of("log_with mail"),
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Theme.of(context).disabledColor,
//                           ),
//                         ),
//                       ),
//                       CommonTextFieldView(
//                         controller: _fnameController,
//                         errorText: _errorFName,
//                         padding: const EdgeInsets.only(
//                             bottom: 16, left: 24, right: 24),
//                         titleText: AppLocalizations(context).of("first_name"),
//                         hintText:
//                             AppLocalizations(context).of("enter_first_name"),
//                         keyboardType: TextInputType.name,
//                         onChanged: (String txt) {},
//                       ),
//                       CommonTextFieldView(
//                         controller: _lnameController,
//                         errorText: _errorLName,
//                         padding: const EdgeInsets.only(
//                             bottom: 16, left: 24, right: 24),
//                         titleText: AppLocalizations(context).of("last_name"),
//                         hintText:
//                             AppLocalizations(context).of("enter_last_name"),
//                         keyboardType: TextInputType.name,
//                         onChanged: (String txt) {},
//                       ),
//                       CommonTextFieldView(
//                         controller: _emailController,
//                         errorText: _errorEmail,
//                         titleText: AppLocalizations(context).of("your_mail"),
//                         padding: const EdgeInsets.only(
//                             left: 24, right: 24, bottom: 16),
//                         hintText:
//                             AppLocalizations(context).of("enter_your_email"),
//                         keyboardType: TextInputType.emailAddress,
//                         onChanged: (String txt) {},
//                       ),
//                       CommonTextFieldView(
//                         titleText: AppLocalizations(context).of("password"),
//                         padding: const EdgeInsets.only(
//                             left: 24, right: 24, bottom: 24),
//                         hintText:
//                             AppLocalizations(context).of('enter_password'),
//                         isObscureText: true,
//                         onChanged: (String txt) {},
//                         errorText: _errorPassword,
//                         controller: _passwordController,
//                       ),
//                       CommonButton(
//                         padding:
//                             EdgeInsets.only(left: 24, right: 24, bottom: 8),
//                         buttonText: AppLocalizations(context).of("sign_up"),
//                         onTap: () {
//                           if (_allValidation())
//                             NavigationServices(context).gotoTabScreen();
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(
//                           AppLocalizations(context).of("terms_agreed"),
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Theme.of(context).disabledColor,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             AppLocalizations(context)
//                                 .of("already_have_account"),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Theme.of(context).disabledColor,
//                             ),
//                           ),
//                           InkWell(
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                             onTap: () {
//                               NavigationServices(context).gotoLoginScreen();
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Text(
//                                 AppLocalizations(context).of("login"),
//                                 style: TextStyles(context)
//                                     .getRegularStyle()
//                                     .copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: AppTheme.primaryColor,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).padding.bottom + 24,
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _appBar() {
//     return CommonAppbarView(
//       iconData: Icons.arrow_back,
//       titleText: AppLocalizations(context).of("sign_up"),
//       onBackClick: () {
//         Navigator.pop(context);
//       },
//     );
//   }

//   bool _allValidation() {
//     bool isValid = true;

//     if (_fnameController.text.trim().isEmpty) {
//       _errorFName = AppLocalizations(context).of('first_name_cannot_empty');
//       isValid = false;
//     } else {
//       _errorFName = '';
//     }

//     if (_lnameController.text.trim().isEmpty) {
//       _errorLName = AppLocalizations(context).of('last_name_cannot_empty');
//       isValid = false;
//     } else {
//       _errorLName = '';
//     }

//     if (_emailController.text.trim().isEmpty) {
//       _errorEmail = AppLocalizations(context).of('email_cannot_empty');
//       isValid = false;
//     } else if (!Validator.validateEmail(_emailController.text.trim())) {
//       _errorEmail = AppLocalizations(context).of('enter_valid_email');
//       isValid = false;
//     } else {
//       _errorEmail = '';
//     }

//     if (_passwordController.text.trim().isEmpty) {
//       _errorPassword = AppLocalizations(context).of('password_cannot_empty');
//       isValid = false;
//     } else if (_passwordController.text.trim().length < 6) {
//       _errorPassword = AppLocalizations(context).of('valid_password');
//       isValid = false;
//     } else {
//       _errorPassword = '';
//     }
//     setState(() {});
//     return isValid;
//   }
// }
