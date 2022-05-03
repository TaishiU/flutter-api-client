import 'dart:convert';

import 'package:api_client/models/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

part 'home_screen_controller.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(false) bool isLoading,
    @Default(AsyncValue.loading()) AsyncValue<List<Todo>> todoList,
  }) = _HomeScreenState;
}

class HomeScreenController extends StateNotifier<HomeScreenState> {
  HomeScreenController({required this.read}) : super(const HomeScreenState()) {
    fetch();
  }

  final Reader read;

  Future<void> fetch() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      );

      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final todoList = jsonList.map((json) => Todo.fromJson(json)).toList();
      // print('todoList.length: ${todoList.length}');
      state = state.copyWith(todoList: AsyncValue.data(todoList));
    } catch (e) {
      print('エラー発生: $e');
      state = state.copyWith(todoList: AsyncValue.error(e));
    }
  }
}
