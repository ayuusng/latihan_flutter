// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotifikasiScreen extends StatefulWidget {
//   const NotifikasiScreen({Key? key}) : super(key: key);

//   @override
//   _NotifikasiScreenState createState() => _NotifikasiScreenState();
// }

// class _NotifikasiScreenState extends State<NotifikasiScreen> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     initializeFlutterLocalNotificationsPlugin();
//   }

//   Future<void> initializeFlutterLocalNotificationsPlugin() async {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> _showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Title',
//       'Body',
//       platformChannelSpecifics,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifikasi'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _showNotification,
//           child: Text('Tampilkan Notifikasi'),
//         ),
//       ),
//     );
//   }
// }
