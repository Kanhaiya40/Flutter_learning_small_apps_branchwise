import 'package:clock_app/helper/date_converter.dart';
import 'package:clock_app/views/widgets/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  static var now = DateTime.now();

  var currentTime = DateConverter.isoDateTimeToTimeFormat(now);

  var currentDate = DateConverter.estimatedDate(now);

  var timeZoneString = now.timeZoneOffset.toString().split(".").first;

  var offSetSign = '';

  @override
  Widget build(BuildContext context) {
    print(timeZoneString);

    if (!timeZoneString.startsWith('-')) {
      offSetSign = '+';
      print(offSetSign);
    }
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getFlatButtons("Clock", "clock_icon.png"),
              getFlatButtons("Alarm", "alarm_icon.png"),
              getFlatButtons("Timer", "timer_icon.png"),
              getFlatButtons("StopWatch", "stopwatch_icon.png"),
            ],
          ),
          VerticalDivider(
            color: Colors.white,
            width: 1,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Text(
                            'Clock',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'avenir'),
                          )),
                      Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentTime,
                                style: TextStyle(
                                  fontSize: 64,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'avenir',
                                ),
                              ),
                              Text(
                                currentDate,
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                      Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Align(
                              alignment: Alignment.center,
                              child: ClockView(
                                size: MediaQuery.of(context).size.height/5,
                              ))),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timezone',
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'UTC' + offSetSign + timeZoneString,
                                  style: TextStyle(
                                      fontFamily: 'avenir',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }

  Widget getFlatButtons(String buttonName, String buttonImage) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FlatButton(
          onPressed: () {},
          child: Column(
            children: [
              Image.asset(
                buttonImage,
                scale: 1.5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'avenir'),
              )
            ],
          )),
    );
  }
}
