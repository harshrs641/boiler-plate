import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/routes/app_routes.dart';
import 'package:boiler_plate/utils/utils.dart';
import 'package:boiler_plate/view/screens/form/form_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class FormView extends HookConsumerWidget with BaseScreenView {
   FormView({super.key});
  late  BuildContext ctx;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ctx = useContext();
    final _viewModel = ref.watch(formViewModel);
    _viewModel.attachView(this);
    final name = useTextEditingController(text: _viewModel.formData.name);
    final age = useState<int>(_viewModel.formData.age ?? 0);
    final gender = useState<bool>(_viewModel.formData.gender == "Male");

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            Row(
              children: [
                const Text("Age"),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    age.value--;
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(age.value.toString()),
                IconButton(
                  onPressed: () {
                    age.value++;
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Gender"),
                const Spacer(),
                const Text("Male"),
                Switch(
                  value: gender.value,
                  onChanged: (val) {
                    gender.value = val;
                  },
                ),
                const Text("Female"),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  _viewModel.submit(
                    name: name.text,
                    age: age.value,
                    gender: gender.value,
                  );
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
 ctx.pushNamed(
      appRoute.name,
      pathParameters: params ?? {},
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
