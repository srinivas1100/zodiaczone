import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:zodiaczone/widgets/appbar/appbar.dart';
import 'package:zodiaczone/widgets/buttons/datebutton.dart';
import 'package:zodiaczone/widgets/cards/customcard.dart';
import 'package:zodiaczone/widgets/cards/innershadow.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool call, video, chat = false;
  bool sun, mon, thu, wed, thus, fri, sat = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: const <Color>[Color(0xffc957ba), Color(0xffb34444)]);
  @override
  Widget build(BuildContext context) {
    String dropDown = '15 Mins';
    var items = ['15 Mins', '30 Mins', '45 Mins', '60 Mins'];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          AppBarWidget(),
          CustomCard(
            height: height * .30,
            width: width * .80,
            radius: 30.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InnerShadow(
                      height: height * .07,
                      width: width * .60,
                      radius: 50.0,
                      child: Center(child: Text('Book Appointment for')),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              call = true;
                              video = false;
                              chat = false;
                            });
                          },
                          child: CustomCard(
                            gradient: call == true ? gradient : null,
                            height: height * .12,
                            width: height * .12,
                            radius: 15.0,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.call),
                                  Text('Call'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              call = false;
                              video = true;
                              chat = false;
                            });
                          },
                          child: CustomCard(
                            gradient: video == true ? gradient : null,
                            height: height * .12,
                            width: height * .12,
                            radius: 15.0,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.video_call),
                                  Text('Video Call'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              call = false;
                              video = false;
                              chat = true;
                            });
                          },
                          child: CustomCard(
                            gradient: chat == true ? gradient : null,
                            height: height * .12,
                            width: height * .12,
                            radius: 15.0,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.chat),
                                  Text('Chat'),
                                ],
                              ),
                            ),
                          ),
                        )
                      ])
                ]),
          ),
          SizedBox(height: height * .05),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCard(
                height: height * .23,
                width: width,
                radius: 15.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.calendar_today),
                              ),
                              TextButton(
                                child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                onPressed: () => _selectDate(context),
                              ),
                            ],
                          )),
                          TextButton(
                            child: Text(
                              selectedTime.format(context).toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            onPressed: () => _selectTime(context),
                          )
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DateButton(
                            gradient: sun == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = true;
                                mon = false;
                                thu = false;
                                wed = false;
                                thus = false;
                                fri = false;
                                sat = false;
                              });
                            },
                            date: selectedDate.day.toString(),
                            day: 'Sun',
                          ),
                          DateButton(
                            gradient: mon == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = false;
                                mon = true;
                                thu = false;
                                wed = false;
                                thus = false;
                                fri = false;
                                sat = false;
                              });
                            },
                            date: '21',
                            day: 'Mon',
                          ),
                          DateButton(
                            gradient: thu == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = false;
                                mon = false;
                                thu = true;
                                wed = false;
                                thus = false;
                                fri = false;
                                sat = false;
                              });
                            },
                            date: '22',
                            day: 'Tue',
                          ),
                          DateButton(
                            gradient: wed == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = false;
                                mon = false;
                                thu = false;
                                wed = true;
                                thus = false;
                                fri = false;
                                sat = false;
                              });
                            },
                            date: '23',
                            day: 'Wed',
                          ),
                          DateButton(
                            gradient: thus == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = false;
                                mon = false;
                                thu = false;
                                wed = false;
                                thus = true;
                                fri = false;
                                sat = false;
                              });
                            },
                            date: '24',
                            day: 'Thu',
                          ),
                          DateButton(
                            gradient: fri == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = false;
                                mon = false;
                                thu = false;
                                wed = false;
                                thus = false;
                                fri = true;
                                sat = false;
                              });
                            },
                            date: '25',
                            day: 'Fri ',
                          ),
                          DateButton(
                            gradient: sat == true ? gradient : null,
                            press: () {
                              setState(() {
                                sun = false;
                                mon = false;
                                thu = false;
                                wed = false;
                                thus = false;
                                fri = false;
                                sat = true;
                              });
                            },
                            date: '26',
                            day: 'Sat',
                          )
                        ]),
                    SizedBox(height: height * 0.02),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCard(
                height: height * .23,
                width: width,
                radius: 15.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.watch_later),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Time",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Duration',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            ),
                            Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: DropdownSearch(
                            dialogMaxWidth: width / 2,
                            maxHeight: height / 3,
                            selectedItem: dropDown,
                            items: items,
                            onChanged: (value) {
                              print(value);
                            },
                            onSaved: (value) {},
                          )),
                          SizedBox(width: width / 3),
                          Text(
                            "Free",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Container(
              height: height * .35,
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: width / 3.3 / (height * .35 / 4.5),
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 16.0,
                  children: [
                    '9.15 AM',
                    '9.30 AM',
                    '9.45 AM',
                    '10.00 AM',
                    '10.15 AM',
                    '10.30 AM',
                    '10.45 AM',
                    '11.00 AM',
                    '11.15 AM',
                    '11.30 AM',
                    '11.45 AM',
                    '12.00 PM',
                    '12.15 PM',
                    '12.30 PM',
                    '12.45 PM',
                    '01.00 PM',
                    '01.15 PM',
                    '01.30 PM',
                    '01.45 PM',
                    '02.00 PM',
                    '02.15 PM',
                    '02.30 PM',
                    '02.45 PM',
                    '03.00 PM',
                    '03.15 PM',
                    '03.30 PM',
                    '03.45 PM',
                    '04.00 PM',
                    '4.15 PM',
                    '4.30 PM',
                    '4.45 PM',
                    '5.00 PM',
                    '5.15 PM',
                    '5.30 PM',
                    '5.45 PM',
                    '6.00 PM',
                    '6.15 PM',
                    '6.30 PM',
                    '6.45 PM',
                    '7.00 PM',
                    '7.15 PM',
                    '7.30 PM',
                    '7.45 PM',
                    '8.00 PM',
                    '8.15 PM',
                    '8.30 PM',
                    '8.45 PM',
                    '9.00 PM',
                    '9.15 PM',
                    '9.30 PM',
                    '9.45 PM',
                    '10.00 PM',
                    '10.15 PM',
                    '10.30 PM',
                    '10.45 PM',
                    '11.00 PM',
                    '11.15 PM',
                    '11.30 PM',
                    '11.45 PM',
                    '12.00 AM',
                    '12.15 AM',
                    '12.30 AM',
                    '12.45 AM',
                    '01.00 AM',
                    '01.15 AM',
                    '01.30 AM',
                    '01.45 AM',
                    '02.00 AM',
                    '02.15 AM',
                    '02.30 AM',
                    '02.45 AM',
                    '03.00 AM',
                    '03.15 AM',
                    '03.30 AM',
                    '03.45 AM',
                    '04.00 AM',
                    '4.15 AM',
                    '4.30 AM',
                    '4.45 AM',
                    '5.00 AM',
                    '5.15 AM',
                    '5.30 AM',
                    '5.45 AM',
                    '6.00 AM',
                    '6.15 AM',
                    '6.30 AM',
                    '6.45 AM',
                    '7.00 AM',
                    '7.15 AM',
                    '7.30 AM',
                    '7.45 AM',
                    '8.00 AM',
                    '8.15 AM',
                    '8.30 AM',
                    '8.45 AM',
                    '9.00 AM',
                  ].map((String time) {
                    return GridTile(
                        child: CustomCard(
                      child: Center(child: Text(time)),
                      height: height * .35 / 4.5,
                      width: width / 3.3,
                      radius: 50.0,
                      color: Colors.black26,
                      shadeColor: Colors.black12,
                    ));
                  }).toList())
              // Center(
              //   child: CustomCard(color: Colors.black26,height: height *.35/4.5, width: width/3.3, radius: 50.0, child: Center(child: Text('data')),)
              // ),
              ),
          CustomCard(
              height: height * .15,
              width: width,
              radius: 25.0,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Free',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomCard(
                        height: height * .08,
                        width: width / 2.5,
                        radius: 50.0,
                        child: Center(
                          child: Text('Set Your schedule'),
                        )),
                  )
                ],
              )))
        ]),
      ),
    );
  }
}
