import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_em/Cubits/task_cubit.dart';
import 'package:plan_em/Screens/ScheduleScreen.dart';
import 'package:plan_em/Screens/TaskCreationScreen.dart';
import 'package:plan_em/Screens/Tasks/AllTasks.dart';
import 'package:plan_em/Screens/Tasks/CompletedTasks.dart';
import 'package:plan_em/Screens/Tasks/FavoriteTasks.dart';
import 'package:plan_em/Screens/Tasks/UncompletedTasks.dart';

import '../reusable_components/PrimaryButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskCubit(),
    child: MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TaskCreationScreen.routeName: (context) => const TaskCreationScreen(),
        ScheduleScreen.routeName: (context) => const ScheduleScreen(),
      },
      title: "Plan 'em",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 17, 17, 17),
        backgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).buttonColor))),
        accentColor: Colors.teal,
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 11.0, fontFamily: 'Hind'),
            bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind')),
        appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).backgroundColor,
            foregroundColor: Theme.of(context).primaryColor,
            titleTextStyle: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 17, 17, 17)),
            iconTheme: IconThemeData(
              color: Color.fromARGB(255, 17, 17, 17),
            )),
        buttonColor: Colors.teal,
      ),
      home: const HomePage(),
    ));
  }
}

class HomePage extends StatefulWidget {
  static String routeName = '/HomeScreen';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabsHeaders = [
      Tab(
          child: Text(
        "All",
        style: Theme.of(context).textTheme.bodyText2,
      )),
      Tab(
          child:
              Text("Completed", style: Theme.of(context).textTheme.bodyText2)),
      Tab(
          child: Text("Uncompleted",
              style: Theme.of(context).textTheme.bodyText2)),
      Tab(
          child:
              Text("Favorite", style: Theme.of(context).textTheme.bodyText2)),
    ];

    List<Widget> tabs = [
      AllTasks(),
      CompletedTasks(),
      UncompletedTasks(),
      FavoriteTasks()
    ];
    return DefaultTabController(
      length: tabsHeaders.length,
      initialIndex: 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          //define tab bar header
          bottom: TabBar(indicatorColor: Colors.teal, tabs: tabsHeaders),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.search,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 25,
              ),
            ),
            //navigate to schedule screen
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ScheduleScreen.routeName);
                },
                child: Icon(
                  Icons.schedule_outlined,
                  size: 25,
                ),
              ),
            ),
          ],
          title: Text(
            "Board",
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: TabBarView(children: tabs),
            ),
            PrimaryButton(
                label: "Add a Task",
                onPressedFunction: () {
                  Navigator.pushNamed(context, TaskCreationScreen.routeName);
                })
          ],
        ),
      ),
    );
  }
}
