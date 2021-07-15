import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcel_tracking/views/pages/mobile_number_page.dart';
import 'package:parcel_tracking/views/pages/otp_varification.dart';

class LoginCardOverlapRoute extends StatefulWidget {
  LoginCardOverlapRoute();

  @override
  LoginCardOverlapRouteState createState() => new LoginCardOverlapRouteState();
}

class LoginCardOverlapRouteState extends State<LoginCardOverlapRoute> {
  TextEditingController mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isEnabled = false;

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
            Text("Enter your mobile number",
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
                      if (text.length == 10) {
                        _isEnabled = true;
                      } else {
                        _isEnabled = false;
                      }
                    });
                  },
                  validator: (value) {},
                  controller: mobileNumberController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    prefixText: "+91",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: _isEnabled
                          ? () {
                              _navigateToVerificationPage(context,mobileNumberController.text);
                            }
                          : null,
                      child: Text("Send OTP"))),
            ))
          ],
        ),
      ),
    ));
  }

  void _navigateToVerificationPage(BuildContext context, String mobileNumber) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerificationCodeRoute(mobileNumber)));
  }
}
