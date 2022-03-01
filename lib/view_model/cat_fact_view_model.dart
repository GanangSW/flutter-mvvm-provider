import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/cat_fact_error.dart';
import 'package:flutter_mvvm_provider/models/cat_fact_model.dart';
import 'package:flutter_mvvm_provider/repo/cat_fact_services.dart';
import 'package:flutter_mvvm_provider/utils/api_status.dart';

class CatFactViewModel extends ChangeNotifier {
  bool _loading = false;
  CatFactModel? _fact;
  CatFactError? _error;

  bool get loading => _loading;

  CatFactModel? get fact => _fact;

  CatFactError? get error => _error;

  CatFactViewModel() {
    getCatFact();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCatFact(CatFactModel fact) {
    _fact = fact;
  }

  setError(CatFactError error) {
    _error = error;
  }

  getCatFact() async {
    setLoading(true);
    var response = await CatFactServices.getCatFact();
    if (response is Success) {
      setCatFact(response.response as CatFactModel);
    }
    if (response is Failure) {
      CatFactError error = CatFactError(
        code: response.code,
        message: response.errorResponse,
      );
      setError(error);
    }
    setLoading(false);
  }
}
