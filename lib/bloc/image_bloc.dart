import 'package:bloc_vs_future/model/image_model.dart';
import 'package:bloc_vs_future/service/service_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<GetImage>((event, emit) async {
      try {
        // ? start loading
        emit(Loading());

        // ?  call service method
        dynamic temp = await ImageServiecImp().getImage();

        // ? change logic from service output
        if (temp is String) {
          emit(Error());
        } else {
          // ? json cast from temp "that was a service output"

          List<ImageModel> images = List.generate(
              temp.length, (index) => ImageModel.fromMap(temp[index]));
          emit(Success(images: images));
        }
      } catch (e) {
        emit(Offline());
      }
    });
  }
}
