import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/photo_remote_datasource.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource remote;

  PhotoRepositoryImpl(this.remote);

  @override
  Future<List<Photo>> getPhotos() {
    return remote.getPhotos();
  }
}