import 'package:flutter/material.dart';
import 'package:test_image_search_app/data/repository/image_item_repository.dart';
import '../data/model/image_item.dart';

class MainViewModel extends ChangeNotifier {

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  ImageItemRepository _repository;
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await _repository.getImageItems(query);

    isLoading = false;
    notifyListeners();
  }
}
