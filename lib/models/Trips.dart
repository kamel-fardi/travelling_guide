// ignore_for_file: file_names

enum TripType {
  exploration,
  recovery,
  activities,
  therapy,
}

enum Season {
  winter,
  spring,
  summer,
  autumn,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  Season season;
  final TripType tripType;
  bool isInSummer;
  bool isInWinter;
  bool isForFamilies;

  Trip(
      {required this.id,
      required this.categories,
      required this.title,
      required this.tripType,
      required this.season,
      required this.imageUrl,
      required this.duration,
      required this.activities,
      required this.program,
      required this.isInSummer,
      required this.isForFamilies,
      required this.isInWinter});
}
