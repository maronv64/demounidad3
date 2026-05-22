import 'package:dio/dio.dart';
import '../models/photo_dto.dart';

class PhotoRemoteDataSource {
  final Dio dio;

  PhotoRemoteDataSource(this.dio);

  Future<List<PhotoDto>> getPhotos() async {
    final response = await dio.get('/photos');

    return (response.data as List)
        .map((e) => PhotoDto.fromJson(e))
        .take(50)
        .toList();
  }
}