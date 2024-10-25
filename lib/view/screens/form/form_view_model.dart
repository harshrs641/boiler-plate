import 'package:boiler_plate/data/local/local.dart';
import 'package:boiler_plate/data/models/models.dart';
import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/helpers/base_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formViewModel =
    ChangeNotifierProvider.autoDispose((ref) => FormViewModel());

class FormViewModel extends BaseViewModel<BaseScreenView> {
  FormModel _formData = FormLocalStorage.readFromStorage();
  FormModel get formData => _formData;
  void submit({
    required String name,
    required int age,
    required bool gender,
  }) {
    toggleLoading();
    final data =
        FormModel(name: name, age: age, gender: gender ? "Male" : "Female");
    FormLocalStorage.writeToStorage(data);
    _formData = data;
    view?.showSnackbar("Successfully!!!");
    toggleLoading();
  }
}
