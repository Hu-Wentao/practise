import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:practise/config/route_manager.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: [
          //todo
        ],
        child: MaterialApp(
          title: 'practise',
          theme: ThemeData(
              primarySwatch: Colors.blue
          ),
//          initialRoute: ,
          onGenerateRoute: RouteManager.generateRoute,

        ),
      ),
    );
  }
}

