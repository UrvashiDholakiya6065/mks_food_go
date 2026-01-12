import 'package:mks_task2_tradingbuddy/screen/commonWidgets/common_field_controllers.dart';
import 'package:mks_task2_tradingbuddy/sesstionManage/sesstion_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> setUserDataPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      SesstionKeys.email,
      CommonFieldControllers.loginEmailController.text,
    );
    await prefs.setString(
      SesstionKeys.password,
      CommonFieldControllers.loginPasswordController.text,
    );
    print("set email shaared pref  ${prefs.getString(SesstionKeys.email)}");
    print(
      "set password shaared pref  ${prefs.getString(SesstionKeys.password)}",
    );
  }

  Future<bool> getUserDataPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(SesstionKeys.email);
    final password = prefs.getString(SesstionKeys.password);
    print("get email shared pref  ${prefs.getString(SesstionKeys.email)}");
    print(
      "get password shared pref  ${prefs.getString(SesstionKeys.password)}",
    );
    return email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  Future<void> logoutPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = await prefs.remove(SesstionKeys.email);
    final password = await prefs.remove(SesstionKeys.password);

    print("remove email shared pref  $email");
    print("remove password shared pref  $password");
  }

  Future<void> setTheme(bool theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      SesstionKeys.isTheme,
      theme,
    );
    print("set theme shaared pref  ${prefs.getBool(SesstionKeys.isTheme)}");
  }
  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getBool(
      SesstionKeys.isTheme)??false;
  }
}
