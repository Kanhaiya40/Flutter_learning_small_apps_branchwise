import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcel_tracking/utils/img_implementation.dart';
import 'package:parcel_tracking/utils/my_colors.dart';
import 'package:parcel_tracking/utils/my_text.dart';
import 'package:parcel_tracking/views/pages/ordered_parcel.dart';
import 'package:parcel_tracking/views/pages/tab_view_bottom.dart';

class VerificationCodeRoute extends StatefulWidget {
  String mobileNumber;
  VerificationCodeRoute(this.mobileNumber);

  @override
  VerificationCodeRouteState createState() => new VerificationCodeRouteState(mobileNumber);
}

class VerificationCodeRouteState extends State<VerificationCodeRoute> {

  String mobileNumber;
  VerificationCodeRouteState(this.mobileNumber);

  bool _isEnabled=false;
  TextEditingController otpTextController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                ),
                Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 10,
                ),
                Text("Enter the OTP sent to ${mobileNumber}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    )),
                Container(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: TextFormField(
                      onChanged: (String text) {
                        setState(() {
                          if (text.length == 4) {
                            _isEnabled = true;
                          } else {
                            _isEnabled = false;
                          }
                        });
                      },
                      validator: (value) {},
                      controller: otpTextController,
                      maxLength: 4,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "One Time Password",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                      ),
                    )),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){

                    }, child: Text("Change Number"),
                    ),
                    TextButton(onPressed: (){

                    }, child: Text("Resend OTP"),
                    ),
                  ],
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: _isEnabled
                                  ? () {
                                _navigateToVerificationPage(context);
                              }
                                  : null,
                              child: Text("Log in"))),
                    ))
              ],
            ),
          ),
        ));
  }

  void _navigateToVerificationPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationPrimaryRoute()));
  }
}
