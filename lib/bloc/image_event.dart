part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

class GetImage extends ImageEvent {}