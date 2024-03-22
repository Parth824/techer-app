import 'package:get/get.dart' hide FormData;
import 'package:tech_lancer_teacher/app/utils/gallery_model.dart';

class ImageVoideController extends GetxController {
  RxList<Gallery> imageList = <Gallery>[].obs;
  RxInt currentIndex = 0.obs;

  // final _videoResponse = VideoResponse().obs;
  // VideoResponse get videoResponse => _videoResponse.value;
  // set videoResponse(VideoResponse value) => _videoResponse.value = value;

  // final _imageResponse = ImageResponse().obs;
  // ImageResponse get imageResponse => _imageResponse.value;
  // set imageResponse(ImageResponse value) => _imageResponse.value = value;

  @override
  void onInit() {
    super.onInit();
  }
}
