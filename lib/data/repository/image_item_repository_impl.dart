import 'package:test_image_search_app/data/mapper/pixabay_image_item_mapper.dart';
import '../data_source/pixabay_api.dart';
import '../model/image_item.dart';
import 'image_item_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageItems(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
