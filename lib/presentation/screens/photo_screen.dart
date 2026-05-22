import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/photo_viewmodel.dart';
import '../widgets/photo_card.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PhotoViewModel>().fetchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PhotoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: vm.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: vm.photos.length,
              itemBuilder: (_, index) {
                return PhotoCard(
                  photo: vm.photos[index],
                );
              },
            ),
    );
  }
}