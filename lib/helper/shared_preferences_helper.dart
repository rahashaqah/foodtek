import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper instance = SharedPreferencesHelper._internal();
  SharedPreferences? _prefs;

  SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  Future<void> _ensureInitialized() async {
    if (_prefs == null) {
      await init();
    }
  }


  Future<void> remove({required String key}) async {
    await _ensureInitialized();
    await _prefs?.remove(key);
  }


  Future<void> savePrefString({required String key, required String value}) async {
    await _ensureInitialized();
    await _prefs?.setString(key, value);
  }

  Future<void> savePrefInt({required String key, required int value}) async {
    await _ensureInitialized();
    await _prefs?.setInt(key, value);
  }

  Future<void> savePrefBool({required String key, required bool value}) async {
    await _ensureInitialized();
    await _prefs?.setBool(key, value);
  }

  Future<void> savePrefDouble({required String key, required double value}) async {
    await _ensureInitialized();
    await _prefs?.setDouble(key, value);
  }

  Future<void> savePrefStringList({required String key, required List<String> value}) async {
    await _ensureInitialized();
    await _prefs?.setStringList(key, value);
  }

  Future<String> getPrefString({required String key, required String defaultValue}) async {
    await _ensureInitialized();
    return _prefs?.getString(key) ?? defaultValue;
  }

  Future<int> getPrefInt({required String key, required int defaultValue}) async {
    await _ensureInitialized();
    return _prefs?.getInt(key) ?? defaultValue;
  }

  Future<bool> getPrefBool({required String key, required bool defaultValue}) async {
    await _ensureInitialized();
    return _prefs?.getBool(key) ?? defaultValue;
  }

  Future<double> getPrefDouble({required String key, required double defaultValue}) async {
    await _ensureInitialized();
    return _prefs?.getDouble(key) ?? defaultValue;
  }

  Future<List<String>> getPrefStringList({required String key, required List<String> defaultValue}) async {
    await _ensureInitialized();
    return _prefs?.getStringList(key) ?? defaultValue;
  }


  Future<void> saveRememberMe({required bool rememberMe}) async {
    await _ensureInitialized();
    await _prefs?.setBool('rememberMe', rememberMe);
  }

  Future<bool> getRememberMe() async {
    await _ensureInitialized();
    return _prefs?.getBool('rememberMe') ?? false;
  }


  Future<void> saveUserData({required String email, required String password}) async {
    await _ensureInitialized();
    await _prefs?.setString('email', email);
    await _prefs?.setString('password', password);
  }

  Future<String> getEmail() async {
    await _ensureInitialized();
    return _prefs?.getString('email') ?? '';
  }

  Future<String> getPassword() async {
    await _ensureInitialized();
    return _prefs?.getString('password') ?? '';
  }
}
