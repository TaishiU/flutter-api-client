import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_client.dart';
import '../models/todo.dart';
import '../providers.dart';

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
    fetchTodo();
  }

  final Reader read;

  ApiClient get _apiClient => read(apiClientProvider);

  static const String endpoint = '/todos';

  Future<void> fetchTodo() async {
    try {
      final responseBody = await _apiClient.get(endpoint: endpoint);
      final jsonList = jsonDecode(responseBody) as List<dynamic>;
      final todoList = jsonList.map((json) => Todo.fromJson(json)).toList();
      state = state.copyWith(todoList: AsyncValue.data(todoList));
    } catch (e) {
      print('エラー発生: $e');
      state = state.copyWith(todoList: AsyncValue.error(e));
    }
  }

  Future<void> createTodo() async {
    try {
      final body = {
        'userId': 1,
        'title': 'I am a developer',
        'completed': true
      };
      final responseBody = await _apiClient.post(
        endpoint: endpoint,
        body: jsonEncode(body),
      );
      print('responseBody: $responseBody');
      final json = jsonDecode(responseBody) as Map<String, dynamic>;
      final todo = Todo.fromJson(json);
      print('todo: $todo');
    } catch (e) {
      print('エラー発生: $e');
    }
  }

  Future<void> updateTodo({required int id}) async {
    try {
      final body = {
        'title': 'I am a Flutter developer',
      };
      final responseBody = await _apiClient.patch(
        endpoint: '$endpoint/$id',
        body: jsonEncode(body),
      );
      print('responseBody: $responseBody');
      final json = jsonDecode(responseBody) as Map<String, dynamic>;
      final todo = Todo.fromJson(json);
      print('todo: $todo');
    } catch (e) {
      print('エラー発生: $e');
    }
  }

  Future<void> deleteTodo({required int id}) async {
    try {
      final responseBody = await _apiClient.delete(endpoint: '$endpoint/$id');
      print('responseBody: $responseBody');
    } catch (e) {
      print('エラー発生: $e');
    }
  }
}
