import '../../domain/entities/photo.dart';

class PhotoDto extends Photo {
  PhotoDto({
    required super.id,
    required super.title,
    required super.url,
    required super.thumbnailUrl,
  });

  // factory PhotoDto.fromJson(Map<String, dynamic> json) {
  //   return PhotoDto(
  //     id: json['id'],
  //     title: json['title'],
  //     url: json['url'],
  //     thumbnailUrl: json['thumbnailUrl'],
  //   );
  // }

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
  return PhotoDto(
    id: json['id'],
    title: json['title'],

    // 🔥 NUEVA FUENTE DE IMÁGENES ESTABLE
    url: 'https://picsum.photos/id/${json['id']}/600/600',
    thumbnailUrl: 'https://picsum.photos/id/${json['id']}/200/200',
  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}