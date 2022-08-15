import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static String isViewOnBoardingKey = 'is_view_on_boarding_key';
  static const _storeTokenKey = 'store_token_key';
  static const _storeUserId = 'store_user_key';
  static const _keyTelephone = 'key_telephone';
  static const _keySaveInfoChange = 'key_saved_info_user';

  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<void> setViewOnBoarding(bool value) async {
    await _prefsInstance?.setBool(isViewOnBoardingKey, value);
  }

  static bool isViewOnBoarding() {
    return _prefsInstance?.getBool(isViewOnBoardingKey) ?? false;
  }

  static String isViewPaymentPolicy = 'is_view_payment_policy_key';
  static Future<void> setViewPaymentPolicy(bool value) async {
    await _prefsInstance?.setBool(isViewPaymentPolicy, value);
  }

  static bool isViewPayment() {
    return _prefsInstance?.getBool(isViewPaymentPolicy) ?? false;
  }

  static String isViewUpdateInfo = 'is_view_update_info_key';
  static Future<void> setUpdateInfo(bool value) async {
    await _prefsInstance?.setBool(isViewOnBoardingKey, value);
  }

  static bool isUpdateInfo() {
    return _prefsInstance?.getBool(isViewOnBoardingKey) ?? false;
  }

  static Future<void> clearAuthData() async {
    // await _prefsInstance?.remove(_PREF_TOKEN_KEY);
  }

  static String telephone = 'telephone';
  static Future<void>? saveTelephone(String telephone) {
    return _prefsInstance?.setString(telephone, telephone);
  }

  static Future<void> clearData() async {
    await _prefsInstance?.clear();
    return;
  }

  static Future<void> clearDataLogout() async {
    var prefs = await _instance;
    prefs.clear();
  }

  static String isCheckUpdateUser = 'is_check_update_user';
  static Future<void> setUpdateUser(bool value) async {
    await _prefsInstance?.setBool(isCheckUpdateUser, value);
  }

  static bool showUpdateInfo() {
    return _prefsInstance?.getBool(isCheckUpdateUser) ?? false;
  }

  static Future<void> saveToken(String value) async {
    var prefs = await _instance;
    prefs.setString(_storeTokenKey, value);
  }

  static Future<String> getToken() async {
    var prefs = await _instance;
    return prefs.getString(_storeTokenKey) ?? '';
  }

  static Future<bool> isLoggedIn() {
    return getToken().then((token) => token.isNotEmpty);
  }

  static String isLoggedInApp = 'is_logged_In';

  static Future<void>? setIsLoggedIn() {
    return _prefsInstance?.setBool(isLoggedInApp, true);
  }

  static bool getIsLoggedIn() {
    return _prefsInstance?.getBool(isLoggedInApp) ?? false;
  }
}
