import 'package:flutter/material.dart';
import 'package:qr_scaner_example/screens/home/home_page.dart';
import 'package:qr_scaner_example/screens/timer/timer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: StopwatchWidget(),),
    );
  }
}


/// Birinchi textfielddan ikkinchisiga o'tkazib yuborish


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyWidget(),
//     );
//   }
// }

// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   late TextEditingController _firstTextFieldController;
//   late TextEditingController _secondTextFieldController;
//   late FocusNode _secondTextFieldFocusNode;

//   @override
//   void initState() {
//     super.initState();
//     _firstTextFieldController = TextEditingController();
//     _secondTextFieldController = TextEditingController();
//     _secondTextFieldFocusNode = FocusNode();

//     _firstTextFieldController.addListener(() {
//       if (_firstTextFieldController.text.length == 19) {
//         FocusScope.of(context).requestFocus(_secondTextFieldFocusNode);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _firstTextFieldController.dispose();
//     _secondTextFieldController.dispose();
//     _secondTextFieldFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _firstTextFieldController,
//               decoration: InputDecoration(
//                 labelText: 'First TextField',
//               ),
//             ),
//             TextField(
//               controller: _secondTextFieldController,
//               focusNode: _secondTextFieldFocusNode,
//               decoration: InputDecoration(
//                 labelText: 'Second TextField',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }