class DisasterModel {
  final int id;
  final String location;
  final String locationDetail;
  final String countryImage;
  final String date;
  final String agotime;
  final double magnitude;
  final double radius;
  final double depth;
  final double lat;
  final double lng;

  DisasterModel(
      {required this.id,
      required this.location,
      required this.locationDetail,
      required this.countryImage,
      required this.date,
      required this.agotime,
      required this.magnitude,
      required this.radius,
      required this.depth,
      required this.lat,
      required this.lng});
}