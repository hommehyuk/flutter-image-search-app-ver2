import 'package:flutter/material.dart';
import 'package:image_search_app2/core/result.dart';
import 'package:image_search_app2/data/model/image_item.dart';
import 'package:image_search_app2/data/repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _imageItemRepository;

  MainViewModel({
    required ImageItemRepository imageItemRepository,
  }) : _imageItemRepository = imageItemRepository;

  Future<void> fetchImages(String query) async {
    final result = await _imageItemRepository.getImageItems(query);

    switch (result) {
      case Success<List<ImageItem>>():
      case Error<List<ImageItem>>():
    }
  }
}
