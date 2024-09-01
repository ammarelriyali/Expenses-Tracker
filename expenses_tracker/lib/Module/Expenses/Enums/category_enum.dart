
import 'package:flutter/material.dart';

enum CategoryEnum {food, travel, leisure, work }
extension CategoryEnumExtension on CategoryEnum {
  IconData icon() {
    switch (this) {
      case CategoryEnum.food:
        return Icons.fastfood;
      case CategoryEnum.leisure:
        return Icons.label;
      case CategoryEnum.travel:
        return Icons.travel_explore;
      case CategoryEnum.work:
        return Icons.work;
    }
  }
}