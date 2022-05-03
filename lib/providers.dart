import 'package:api_client/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/home_screen_controller.dart';

//ApiClient
final apiClientProvider = Provider((ref) {
  return ApiClient();
});

//Controller
final homeScreenController =
    StateNotifierProvider<HomeScreenController, HomeScreenState>(
  (ref) => HomeScreenController(read: ref.read),
);
