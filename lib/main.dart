import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/network/dio_client.dart';
import 'data/datasources/photo_remote_datasource.dart';
import 'data/repositories/photo_repository_impl.dart';
import 'presentation/screens/photo_screen.dart';
import 'presentation/viewmodels/photo_viewmodel.dart';

void main() {
  final dio = DioClient().dio;

  final datasource = PhotoRemoteDataSource(dio);
  final repository = PhotoRepositoryImpl(datasource);

  runApp(
    ChangeNotifierProvider(
      create: (_) => PhotoViewModel(repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoScreen(),
    );
  }
}