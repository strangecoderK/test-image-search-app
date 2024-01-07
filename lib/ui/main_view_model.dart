import 'package:flutter/material.dart';
import 'package:test_image_search_app/data/repository/image_item_repository_impl.dart';
import '../data/model/image_item.dart';

class MainViewModel extends ChangeNotifier {
  final repository = ImageItemRepositoryImpl();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await repository.getImageItems(query);

    isLoading = false;
    notifyListeners();
  }
}
