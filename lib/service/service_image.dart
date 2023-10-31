import 'package:dio/dio.dart';

abstract class ImageServiec {
  Dio dio = Dio();

  String baseUrl = 'http://jsonplaceholder.typicode.com/photos';

  getImage();
}

class ImageServiecImp extends ImageServiec {
  @override
  getImage() async {
    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return 'false';
      }
    } catch (e) {
      throw e;
    }
  }
}
