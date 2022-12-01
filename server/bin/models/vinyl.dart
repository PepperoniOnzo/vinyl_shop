class Vinyl {
  final int id;
  final String author;
  final String album;
  final int albumYear;
  final int plateYear;
  final String country;
  final List<String> genre;
  final String imagePreview;
  final String imageFull;

  Vinyl({
    required this.id,
    required this.author,
    required this.album,
    required this.albumYear,
    required this.plateYear,
    required this.country,
    required this.genre,
    required this.imagePreview,
    required this.imageFull,
  });

  factory Vinyl.fromJson(Map<String, dynamic> json) {
    return Vinyl(
      id: json['id'],
      author: json['author'],
      album: json['album'],
      albumYear: json['albumYear'],
      plateYear: json['plateYear'],
      country: json['country'],
      genre: List<String>.from(json['genre']),
      imagePreview: json['imagePreview'],
      imageFull: json['imageFull'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'album': album,
      'albumYear': albumYear,
      'plateYear': plateYear,
      'country': country,
      'genre': genre,
      'imagePreview': imagePreview,
      'imageFull': imageFull,
    };
  }
}
