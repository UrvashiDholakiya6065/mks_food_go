import 'package:foodgo/route/app_route.dart';
import 'package:foodgo/sessionManage/sesstion_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Future<void> setUserDataPref({required String loginEmailController}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(
  //     SesstionKeys.email,
  //     loginEmailController,
  //   );
  //
  //   print("set email shaared pref  ${prefs.getString(SesstionKeys.email)}");
  //
  // }
  Future<void> setUserDataPref({required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SesstionKeys.email, email);
    print("Set email in pref ::::---${ prefs.get(SesstionKeys.email) }");
    await prefs.setBool(SesstionKeys.isLoggedIn, true);
  }
  Future<void> setUserMobileNum({required String mobileNum}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SesstionKeys.mobileKey, mobileNum);
    print("Set mobileNumber in pref ::::---${ prefs.get(SesstionKeys.mobileKey) }");
    await prefs.setBool(SesstionKeys.isLoggedIn, true);
  }
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SesstionKeys.email);
  }
  Future<String?> getProfileData() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('email');
  }
  Future<String?> getUserMobileNum() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SesstionKeys.mobileKey);
  }
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SesstionKeys.isLoggedIn) ?? false;
  }


  Future<void> logoutPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = await prefs.remove(SesstionKeys.email);


    print("remove email shared pref  $email");
  }

  Future<void> logoutPrefMobilNum() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final mobile = await prefs.remove(SesstionKeys.mobileKey);
    final logedIn = await prefs.remove(SesstionKeys.isLoggedIn);
    await prefs.clear();
    appRoute.go('/LoginWithOtp');

    print("remove mobileKey shared pref  $mobile");
    print("remove logedIn shared pref  $logedIn");
    print("Session cleared");

  }
  //
}
