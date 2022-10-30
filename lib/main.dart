import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'TravelPal';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
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
      'Trips',
      style: optionStyle,
    ),
    Text(
      'Transaction History',
      style: optionStyle,
    ),
    Text(
      'Calendar',
      style: optionStyle,
    ),
    Text(
      'Profile',
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
        title: const Text('TravelPal'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trips',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Transction History',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'calendar',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fine Travel'),
   
//       ),
//       body: ListView(
//         // child: _widgetOptions.elementAt(_selectedIndex),
//         // Container{new Image.asset("assets/images/login.png"),
//         children: <Widget>[
//             Container(
//               child: Text('name hello')
//             )
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
            
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }


// @JsonSerializable()
// class Person {
//   final String firstName;
//   @JsonKey(includeIfNull: false)
//   final String? middleName;
//   final String lastName;

//   @JsonKey(name: 'date-of-birth')
//   final DateTime dateOfBirth;

//   @JsonKey(name: 'last-order')
//   final DateTime? lastOrder;

//   List<Order> orders;

//   Person(
//     this.firstName,
//     this.lastName,
//     this.dateOfBirth, {
//     this.middleName,
//     this.lastOrder,
//     List<Order>? orders,
//   }) : orders = orders ?? <Order>[];

//   factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

//   Map<String, dynamic> toJson() => _$PersonToJson(this);
// }

// @JsonSerializable(includeIfNull: false)
// class Order {
//   int? count;
//   int? itemNumber;
//   bool? isRushed;
//   Item? item;

//   @JsonKey(
//       name: 'prep-time',
//       fromJson: _durationFromMilliseconds,
//       toJson: _durationToMilliseconds)
//   Duration? prepTime;

//   @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
//   final DateTime date;

//   Order(this.date);

//   factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

//   Map<String, dynamic> toJson() => _$OrderToJson(this);

//   static Duration? _durationFromMilliseconds(int? milliseconds) =>
//       milliseconds == null ? null : Duration(milliseconds: milliseconds);

//   static int? _durationToMilliseconds(Duration? duration) =>
//       duration?.inMilliseconds;

//   static DateTime _dateTimeFromEpochUs(int us) =>
//       DateTime.fromMicrosecondsSinceEpoch(us);

//   static int? _dateTimeToEpochUs(DateTime? dateTime) =>
//       dateTime?.microsecondsSinceEpoch;
// }

// @JsonSerializable()

// class User {
//   User(this.name, this.email);

//   String name;
//   String email;

//   /// A necessary factory constructor for creating a new User instance
//   /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
//   /// The constructor is named after the source class, in this case, User.
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   /// `toJson` is the convention for a class to declare support for serialization
//   /// to JSON. The implementation simply calls the private, generated
//   /// helper method `_$UserToJson`.
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }

// @JsonLiteral('data.json')
// Map get glossaryData => _$glossaryDataJsonLiteral;