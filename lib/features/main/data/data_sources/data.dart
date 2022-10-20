import 'package:grand_paris_express/features/main/domain/entities/line.dart';
import 'package:grand_paris_express/features/main/domain/entities/section.dart';
import 'package:grand_paris_express/features/main/domain/entities/station.dart';

class Data {
  static final List<Line> in2022 = [];
  static final List<Line> in2023 = [];
  static final List<Line> in2024 = [];
  static final List<Line> in2025 = [];
  static final List<Line> in2026 = [];
  static final List<Line> in2027 = [];
  static final List<Line> in2028 = [];
  static final List<Line> in2029 = [];
  static final List<Line> in2030 = [];
  static final List<Line> beyond2030 = [
    Line(
      "11",
      "11",
      "Métro",
      "assets/images/lines/metro/11.png",
      ["Chatelet", "Noisy - Champs"],
      [
        Section("11", "11", Station("", "Chatelet", "", []),
            Station("", "Noisy - Champs", "", []), []),
      ],
    ),
    Line(
      "14",
      "14",
      "Métro",
      "assets/images/lines/metro/14.png",
      ["Saint-Denis Pleyel", "Aéroport d'Orly"],
      [
        Section("14", "14", Station("", "Saint-Denis Pleyel", "", []),
            Station("", "Aéroport d'Orly", "", []), []),
      ],
    ),
    Line(
      "15",
      "15",
      "Métro",
      "assets/images/lines/metro/15.png",
      [
        "Noisy - Champs",
        "Pont de Sèvres",
        "Saint-Denis Pleyel",
        "Champigny Centre"
      ],
      [
        Section(
          "15sud",
          "15 Sud",
          Station("", "Noisy - Champs", "", []),
          Station("", "Pont de Sèvres", "", []),
          [],
        ),
        Section(
          "15ouest",
          "15 Ouest",
          Station("", "Pont de Sèvres", "", []),
          Station("", "Saint-Denis Pleyel", "", []),
          [],
        ),
        Section(
          "15est",
          "15 Est",
          Station("", "Saint-Denis Pleyel", "", []),
          Station("", "Champigny Centre", "", []),
          [],
        ),
      ],
    ),
    Line(
      "16",
      "16",
      "Métro",
      "assets/images/lines/metro/16.png",
      ["Saint-Denis Pleyel", "Noisy - Champs"],
      [
        Section("16", "16", Station("", "Noisy - Champs", "", []),
            Station("", "Saint-Denis Pleyel", "", []), []),
      ],
    ),
    Line(
      "17",
      "17",
      "Métro",
      "assets/images/lines/metro/17.png",
      ["Saint-Denis Pleyel", "Le Mesnil-Amelot"],
      [
        Section("17", "17", Station("", "Le Mesnil-Amelot", "", []),
            Station("", "Saint-Denis Pleyel", "", []), []),
      ],
    ),
    Line(
      "18",
      "18",
      "Métro",
      "assets/images/lines/metro/18.png",
      ["Versailles Chantiers", "Aéroport d'Orly"],
      [
        Section("18", "18", Station("", "Versailles Chantiers", "", []),
            Station("", "Aéroport d'Orly", "", []), []),
      ],
    ),
  ];
}
