import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  var email1 = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      print(user?.emailVerified);
      if (user?.emailVerified == true) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email1, password: password);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => BottomTabScreen()),
        // );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
        // } else if (user?.emailVerified == false) {
        //   print('Email not verified');
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       backgroundColor: Colors.orangeAccent,
        //       content: Text(
        //         "Email not verified",
        //         style: TextStyle(fontSize: 18.0, color: Colors.black),
        //       ),
        //     ),
        //   );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
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
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email1 = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ForgotPassword(),
                        //   ),
                        // )
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text('Signup'),
                    ),
                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (context, a, b) => UserMain(),
                    //           transitionDuration: Duration(seconds: 0),
                    //         ),
                    //         (route) => false)
                    //   },
                    //   child: Text('Dashboard'),
                    // ),
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
// import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
// import 'package:flutter_hotel_booking_ui/modules/login/facebook_twitter_button_view.dart';
// import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
// import 'package:flutter_hotel_booking_ui/utils/validator.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_appbar_view.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
// import 'package:flutter_hotel_booking_ui/widgets/common_text_field_view.dart';
// import 'package:flutter_hotel_booking_ui/widgets/remove_focuse.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String _errorEmail = '';
//   TextEditingController _emailController = TextEditingController();
//   String _errorPassword = '';
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RemoveFocuse(
//         onClick: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CommonAppbarView(
//               iconData: Icons.arrow_back,
//               titleText: AppLocalizations(context).of("login"),
//               onBackClick: () {
//                 Navigator.pop(context);
//               },
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(top: 32),
//                       child: FacebookTwitterButtonView(),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         AppLocalizations(context).of("log_with mail"),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Theme.of(context).disabledColor,
//                         ),
//                       ),
//                     ),
//                     CommonTextFieldView(
//                       controller: _emailController,
//                       errorText: _errorEmail,
//                       titleText: AppLocalizations(context).of("your_mail"),
//                       padding: const EdgeInsets.only(
//                           left: 24, right: 24, bottom: 16),
//                       hintText:
//                           AppLocalizations(context).of("enter_your_email"),
//                       keyboardType: TextInputType.emailAddress,
//                       onChanged: (String txt) {},
//                     ),
//                     CommonTextFieldView(
//                       titleText: AppLocalizations(context).of("password"),
//                       padding: const EdgeInsets.only(left: 24, right: 24),
//                       hintText: AppLocalizations(context).of("enter_password"),
//                       isObscureText: true,
//                       onChanged: (String txt) {},
//                       errorText: _errorPassword,
//                       controller: _passwordController,
//                     ),
//                     _forgotYourPasswordUI(),
//                     CommonButton(
//                       padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
//                       buttonText: AppLocalizations(context).of("login"),
//                       onTap: () {
//                         if (_allValidation())
//                           NavigationServices(context).gotoTabScreen();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _forgotYourPasswordUI() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           InkWell(
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             onTap: () {
//               NavigationServices(context).gotoForgotPassword();
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 AppLocalizations(context).of("forgot_your_Password"),
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Theme.of(context).disabledColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   bool _allValidation() {
//     bool isValid = true;
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
