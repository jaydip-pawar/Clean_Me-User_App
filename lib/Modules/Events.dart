class Event {
  String name;
  String image;
  String date;
  Map category;
  String location;
  String fromTo;
  int participants;
  String cost;
  int duration;
  String about;

  Event({
    required this.name,
    required this.image,
    required this.date,
    required this.category,
    required this.location,
    required this.fromTo,
    required this.participants,
    required this.cost,
    required this.duration,
    required this.about,
  });
}