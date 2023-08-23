import 'package:flutter/material.dart';

class eventCategory {
  final int id;
  final String name;
  final IconData icon;

  eventCategory({required this.id, required this.name, required this.icon});
}

final allCategory = eventCategory(
  id: 0,
  name: "All Categories",
  icon: Icons.pin_drop_outlined,
);

final  EventCategory = eventCategory(
  id: 1,
  name: "Event",
  icon: Icons. event_available_outlined,
);
final  VenuesCategory = eventCategory(
  id: 2,
  name: "Venues",
  icon: Icons. house_rounded,
);

final  CateringCategory = eventCategory(
  id: 3,
  name: "Catering",
  icon: Icons. food_bank_outlined,
);

final musicCategory = eventCategory(
  id: 4,
  name: "Music",
  icon: Icons.music_note,
);

final categories = [
  allCategory,
  EventCategory,
  VenuesCategory,
  CateringCategory,
  musicCategory,
];
