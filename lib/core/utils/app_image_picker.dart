import 'package:image_picker/image_picker.dart';

import '../enums/image_source_type.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImage(ImageSourceType sourceType) async {
    return _picker.pickImage(
      source: sourceType == ImageSourceType.camera
          ? ImageSource.camera
          : ImageSource.gallery,
      imageQuality: 80,
    );
  }
}
