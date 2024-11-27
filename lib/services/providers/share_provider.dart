import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verbat_iot/services/shared/shared_prefrence.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});
