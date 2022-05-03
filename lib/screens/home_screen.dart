import 'package:api_client/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/todo.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList =
        ref.watch(homeScreenController.select((state) => state.todoList));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Client'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeScreenController.notifier).fetch(),
        child: todoList.when(
          error: (error, stackTrace) => _buildError(error: error),
          loading: () => _buildLoading(),
          data: (todoList) => _buildData(todoList: todoList),
        ),
      ),
    );
  }

  Widget _buildError({required Object error}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'データの取得に失敗しました...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(error.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildData({required List<Todo> todoList}) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return Card(
              child: ListTile(
                leading: Text(todo.id.toString()),
                title: Text(todo.title!),
                trailing: todo.completed!
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
