import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Fine Travel';

  @override
  Widget build(BuildContext context) {

    return  const MaterialApp(

      title: _title,
      home:  MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fine Travel'),
   
      ),
      body: ListView(
        // child: _widgetOptions.elementAt(_selectedIndex),
        // Container{new Image.asset("assets/images/login.png"),
        children: <Widget>[
            Container(
              child: Text('name hello')
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

      // body: ListView(
      //   // child: _widgetOptions.elementAt(_selectedIndex),
      //   // Container{new Image.asset("assets/images/login.png"),
      //   children: <Widget>[
  
      //       Container(
      //         child: Text('name hello')
      //       )
      //   ],
      // ),


// // // Copyright 2018 The Flutter team. All rights reserved.
// // // Use of this source code is governed by a BSD-style license that can be
// // // found in the LICENSE file.

// // import 'package:flutter/material.dart';

// // void main() => runApp(const MyApp());

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
  

// //   @override
// //   Widget build(BuildContext context) {
// //     var title = 'Web Images';

// //     return MaterialApp(
// //       title: title,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text(title),
// //         ),
// //         body: Image.network('https://picsum.photos/250?image=9'),
// //       ),
// //     );
// //   }
// // }      theme: ThemeData(primaryColor: Colors.purple[900]),














// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class Person {
  final String firstName;
  @JsonKey(includeIfNull: false)
  final String? middleName;
  final String lastName;

  @JsonKey(name: 'date-of-birth')
  final DateTime dateOfBirth;

  @JsonKey(name: 'last-order')
  final DateTime? lastOrder;

  List<Order> orders;

  Person(
    this.firstName,
    this.lastName,
    this.dateOfBirth, {
    this.middleName,
    this.lastOrder,
    List<Order>? orders,
  }) : orders = orders ?? <Order>[];

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Order {
  int? count;
  int? itemNumber;
  bool? isRushed;
  Item? item;

  @JsonKey(
      name: 'prep-time',
      fromJson: _durationFromMilliseconds,
      toJson: _durationToMilliseconds)
  Duration? prepTime;

  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime date;

  Order(this.date);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  static Duration? _durationFromMilliseconds(int? milliseconds) =>
      milliseconds == null ? null : Duration(milliseconds: milliseconds);

  static int? _durationToMilliseconds(Duration? duration) =>
      duration?.inMilliseconds;

  static DateTime _dateTimeFromEpochUs(int us) =>
      DateTime.fromMicrosecondsSinceEpoch(us);

  static int? _dateTimeToEpochUs(DateTime? dateTime) =>
      dateTime?.microsecondsSinceEpoch;
}

@JsonSerializable()
class Item {
  int? count;
  int? itemNumber;
  bool? isRushed;

  Item();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonLiteral('data.json')
Map get glossaryData => _$glossaryDataJsonLiteral;