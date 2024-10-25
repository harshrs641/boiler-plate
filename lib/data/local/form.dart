import 'package:boiler_plate/data/models/form_model.dart';
import 'package:boiler_plate/services/shared_preference_service.dart';

class FormLocalStorage {
  static const key = "form";
  static Future<void> writeToStorage(FormModel data) async {
    final value = formModelToJson(data);
    await SharedPreferenceService.setString(key, value);
  }

  static FormModel readFromStorage() {
    final value = SharedPreferenceService.getString(key);
    if (value?.isEmpty ?? true) {
      return const FormModel(age: 0, gender: "Male", name: "");
    }
    return formModelFromJson(value!);
  }
}
