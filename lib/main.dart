import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/view/cat_fact_view.dart';
import 'package:flutter_mvvm_provider/view_model/cat_fact_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatFactViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CatFactView(),
      ),
    );
  }
}
