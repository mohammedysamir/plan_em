import 'package:flutter/material.dart';
import 'package:plan_em/Screens/TaskCreationScreen.dart';
import 'package:plan_em/Screens/Tasks/AllTasks.dart';
import 'package:plan_em/Screens/Tasks/CompletedTasks.dart';
import 'package:plan_em/Screens/Tasks/FavoriteTasks.dart';
import 'package:plan_em/Screens/Tasks/UncompletedTasks.dart';
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
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TaskCreationScreen.routeName: (context) => const TaskCreationScreen(),
      },
      title: "Plan 'em",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 17, 17, 17),
        backgroundColor: Colors.white,
        accentColor: Colors.teal,
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 11.0, fontFamily: 'Hind'),
            bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind')),
        appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).backgroundColor,
            foregroundColor: Theme.of(context).primaryColor,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            )),
        buttonColor: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static String routeName = '/HomeScreen';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //define tab bar header
          bottom: TabBar(
            indicatorColor: Colors.green,
            tabs: [
              Tab(
                  child: Text(
                "All",
                style: Theme.of(context).textTheme.bodyText2,
              )),
              Tab(
                  child: Text("Completed",
                      style: Theme.of(context).textTheme.bodyText2)),
              Tab(
                  child: Text("Uncompleted",
                      style: Theme.of(context).textTheme.bodyText2)),
              Tab(
                  child: Text("Favorite",
                      style: Theme.of(context).textTheme.bodyText2)),
            ],
          ),
          actions: const [
            //todo: handle clicks
            Padding(
              padding: EdgeInsets.only(left: 7, right: 7),
              child: Icon(
                Icons.search,
                size: 28,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, right: 7),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 28,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, right: 7),
              child: Icon(
                Icons.menu,
                size: 28,
              ),
            ),
          ],
          title: Text(
            "Board",
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //define different tabs/screens
              const TabBarView(children: [
                AllTasks(),
                CompletedTasks(),
                UncompletedTasks(),
                FavoriteTasks()
              ]),
              //todo: add button to task screens.
              // PrimaryButton(
              //     label: "Add a Task",
              //     onClickFunction: () {
              //       Navigator.pushNamed(context, TaskCreationScreen.routeName);
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
