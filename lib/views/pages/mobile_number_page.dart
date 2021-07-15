// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:parcel_tracking/utils/img_implementation.dart';
// import 'package:parcel_tracking/utils/my_colors.dart';
// import 'package:parcel_tracking/utils/my_text.dart';
// import 'package:parcel_tracking/views/pages/otp_varification.dart';
//
// class VerificationPhoneRoute extends StatefulWidget {
//   VerificationPhoneRoute();
//
//   @override
//   VerificationPhoneRouteState createState() =>
//       new VerificationPhoneRouteState();
// }
//
// class VerificationPhoneRouteState extends State<VerificationPhoneRoute> {
//   TextEditingController ctrl = TextEditingController();
//   TextEditingController ctr2 = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     ctrl.text = "+91";
//     ctr2.text = "9767058778";
//
//     return new Scaffold(
//       backgroundColor: Colors.white,
//       appBar:
//           PreferredSize(child: Container(), preferredSize: Size.fromHeight(0)),
//       body: ListView(padding: EdgeInsets.all(0.0), shrinkWrap: true, children: <
//           Widget>[
//         Stack(
//           children: <Widget>[
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 250,
//                 child: Column(
//                   children: <Widget>[
//                     Container(height: 50),
//                     Container(
//                       child:
//                           Image.asset(Img.get('img_number_verification.png')),
//                       width: 220,
//                       height: 220,
//                     ),
//                     Text("Verify Your Number",
//                         style: MyText.title(context).copyWith(
//                             color: MyColors.grey_80,
//                             fontWeight: FontWeight.bold)),
//                     Container(height: 15),
//                     Container(
//                       width: 220,
//                       child: Text(
//                         "Please enter your mobile number to receive a verification code.",
//                         style: MyText.subhead(context)
//                             .copyWith(color: MyColors.grey_60),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Container(height: 15),
//                     Card(child:Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: <Widget>[
//                           Flexible(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 border: InputBorder.none
//                               ),
//                               enabled: false,
//                               keyboardType: TextInputType.text,
//                               style: MyText.headline(context).copyWith(
//                                 color: MyColors.grey_90,
//                               ),
//                               controller: ctrl,
//                             ),
//                           ),
//                           Flexible(
//                             child: TextField(
//                               keyboardType: TextInputType.text,
//                               style: MyText.headline(context).copyWith(
//                                   color: MyColors.grey_90,
//                                   fontWeight: FontWeight.bold),
//                               controller: ctr2,
//                               decoration:
//                                   InputDecoration(border: InputBorder.none),
//                             ),
//                             flex: 4,
//                           )
//                         ],
//                       ),
//                     )),
//                     Container(height: 15,),
//                     Container(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.red[300],
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(18.0))),
//                         child: Text("CONTINUE",
//                             style: TextStyle(color: Colors.white)),
//                         onPressed: () {})
//                         },
//                       ),
//                     ),
//                     Container(
//                       width: 200,
//                       child: TextButton(
//                         style:
//                             TextButton.styleFrom(primary: Colors.transparent),
//                         child: Text("NO, OTHER TIME",
//                             style: TextStyle(color: MyColors.grey_40)),
//                         onPressed: () {},
//                       ),
//                     )
//                   ],
//                   mainAxisSize: MainAxisSize.min,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ]),
//     );
//   }
// }
