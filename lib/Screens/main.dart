import 'package:flutter/material.dart';
import 'package:plan_em/Screens/TaskCreationScreen.dart';
import 'package:plan_em/reusable_components/PrimaryButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/MainScreen',
        routes: {
        '/MainScreen': (context) => const MyApp(),
          '/TaskCreationScreen': (context) => const TaskCreationScreen(),

        },
        title: "Plan 'em",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: const [
              //todo: handle clicks
              Icon(Icons.search),
              Icon(Icons.notifications_none_outlined),
              Icon(Icons.menu)
            ],
            title: const Text("Board",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white,
          ),
          body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //todo: create tabBar
              //todo: create listTiles to contain lists
              PrimaryButton(label: "Add a Task", onClickFunction: (){
                Navigator.pushNamed(context, '/TaskCreationScreen');
              })
            ],
          ),
        )
    );
  }
}
