import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'mood.g.dart';

@HiveType(typeId: 10)
enum Mood {
  @HiveField(0)
  veryHappy,
  @HiveField(1)
  happy,
  @HiveField(2)
  neutral,
  @HiveField(3)
  bored,
  @HiveField(4)
  stressed,
  @HiveField(5)
  sad,
  @HiveField(6)
  tired,
}

extension MoodX on Mood {
  String get label {
    switch (this) {
      case Mood.veryHappy:
        return 'Çok mutlu';
      case Mood.happy:
        return 'Mutlu';
      case Mood.neutral:
        return 'Nötr';
      case Mood.bored:
        return 'Sıkılmış';
      case Mood.stressed:
        return 'Stresli';
      case Mood.sad:
        return 'Üzgün';
      case Mood.tired:
        return 'Yorgun';
    }
  }

  IconData get icon {
    switch (this) {
      case Mood.veryHappy:
        return Icons.sentiment_very_satisfied_rounded;
      case Mood.happy:
        return Icons.sentiment_satisfied_alt_rounded;
      case Mood.neutral:
        return Icons.sentiment_neutral_rounded;
      case Mood.bored:
        return Icons.sentiment_dissatisfied_rounded;
      case Mood.stressed:
        return Icons.mood_bad_rounded;
      case Mood.sad:
        return Icons.sentiment_very_dissatisfied_rounded;
      case Mood.tired:
        return Icons.bedtime_rounded;
    }
  }

  Color get color {
    switch (this) {
      case Mood.veryHappy:
        return Colors.green;
      case Mood.happy:
        return Colors.lightGreen;
      case Mood.neutral:
        return Colors.blueGrey;
      case Mood.bored:
        return Colors.orange;
      case Mood.stressed:
        return Colors.redAccent;
      case Mood.sad:
        return Colors.deepPurple;
      case Mood.tired:
        return Colors.indigo;
    }
  }
}

