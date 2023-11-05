part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

final class ImageInitial extends ImageState {}

class Success extends ImageState {
  List<ImageModel> images;
  Success({
    required this.images,
  });
}

class Error extends ImageState {}

class Loading extends ImageState {}

class Offline extends ImageState {}
