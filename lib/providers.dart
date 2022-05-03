import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/home_screen_controller.dart';

final homeScreenController =
    StateNotifierProvider<HomeScreenController, HomeScreenState>(
  (ref) => HomeScreenController(read: ref.read),
);
