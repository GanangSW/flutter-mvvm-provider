import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/view_model/cat_fact_view_model.dart';
import 'package:provider/provider.dart';

class CatFactView extends StatelessWidget {
  const CatFactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatFactViewModel catFactViewModel = context.watch<CatFactViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Fact"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/cat.png'),
              _showCatFact(catFactViewModel),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => catFactViewModel.getCatFact(),
                child: const Text("Get Fact"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showCatFact(CatFactViewModel catFactViewModel) {
    if (catFactViewModel.loading) {
      return const CupertinoActivityIndicator();
    }
    if (catFactViewModel.error != null) {
      return Text(
        catFactViewModel.error!.message as String,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }
    return Text(
      catFactViewModel.fact!.fact!,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
