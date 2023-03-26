class People {
  final String imagePath;
  final String name;
  final String location;
  final Status status;

  People({
    required this.imagePath,
    required this.name,
    required this.location,
    required this.status,
  });
}

enum Status { safe, danger, unknown }
