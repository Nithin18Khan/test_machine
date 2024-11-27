import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferencesService class to handle SharedPreferences operations
class SharedPreferencesService {
  // Save data to SharedPreferences
  Future<void> saveData({
    required String nationalId,
    required String farmId,
    required String fatherName,
    required String coopId,
    required String coopName,
    required String dob,
    required String gender,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nationalId', nationalId);
    prefs.setString('farmId', farmId);
    prefs.setString('fatherName', fatherName);
    prefs.setString('coopId', coopId);
    prefs.setString('coopName', coopName);
    prefs.setString('dob', dob);
    prefs.setString('gender', gender);
  }

  // Retrieve data from SharedPreferences
  Future<Map<String, String>> getSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'nationalId': prefs.getString('nationalId') ?? '',
      'farmId': prefs.getString('farmId') ?? '',
      'fatherName': prefs.getString('fatherName') ?? '',
      'coopId': prefs.getString('coopId') ?? '',
      'coopName': prefs.getString('coopName') ?? '',
      'dob': prefs.getString('dob') ?? '',
      'gender': prefs.getString('gender') ?? '',
    };
  }

  // Clear all data from SharedPreferences
  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear(); // Clears all saved data
  }
}

// StateNotifier for managing SharedPreferences state
class SharedPreferencesNotifier extends StateNotifier<Map<String, String>> {
  // Constructor
  SharedPreferencesNotifier(this.ref) : super({}) {
    loadData(); // Load data on initialization
  }

  // This is the reference to read providers (replaces Reader in Riverpod 2.x)
  final Ref ref;

  // Load data from SharedPreferences
  Future<void> loadData() async {
    final prefsService = ref.read(
        sharedPreferencesServiceProvider); // Access SharedPreferencesService
    final data = await prefsService.getSavedData();
    state = data; // Update the state with the data
  }

  // Save data to SharedPreferences
  Future<void> saveData({
    required String nationalId,
    required String farmId,
    required String fatherName,
    required String coopId,
    required String coopName,
    required String dob,
    required String gender,
  }) async {
    final prefsService = ref.read(sharedPreferencesServiceProvider);
    await prefsService.saveData(
      nationalId: nationalId,
      farmId: farmId,
      fatherName: fatherName,
      coopId: coopId,
      coopName: coopName,
      dob: dob,
      gender: gender,
    );
    loadData(); // Reload the data after saving
  }

  // Delete data from SharedPreferences
  Future<void> deleteData() async {
    final prefsService = ref.read(sharedPreferencesServiceProvider);
    await prefsService.clearData();
    state = {}; // Clear the state
  }
}

// Provider to access the SharedPreferencesNotifier
final sharedPreferencesNotifierProvider =
    StateNotifierProvider<SharedPreferencesNotifier, Map<String, String>>(
  (ref) => SharedPreferencesNotifier(ref),
);

// SharedPreferencesService provider
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});
