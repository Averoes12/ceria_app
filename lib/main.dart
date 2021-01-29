import 'package:ceria_app/main/bloc/auth_bloc.dart';
import 'package:ceria_app/main/main-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc())
      ],
      child: MaterialApp(
        title: 'Ceria App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen()
      ),
    );
  }
}
