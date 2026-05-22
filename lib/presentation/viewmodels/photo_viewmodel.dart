import 'package:flutter/material.dart';
import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';

class PhotoViewModel extends ChangeNotifier {
  final PhotoRepository repository;

  PhotoViewModel(this.repository);

  List<Photo> photos = [];
  bool loading = false;

  Future<void> fetchPhotos() async {
    loading = true;
    notifyListeners();

    photos = await repository.getPhotos();

    loading = false;
    notifyListeners();
  }
}