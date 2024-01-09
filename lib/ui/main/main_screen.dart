import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.fetchImages(_textController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
          ),
          state.isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final imageItem = state.imageItems[index];
                    return Text(imageItem.tags);
                  },
                ),
        ],
      ),
    );
  }
}
