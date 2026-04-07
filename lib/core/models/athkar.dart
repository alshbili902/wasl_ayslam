class Athkar {
  final String id;
  final String categoryId;
  final String title;
  final String arabicText;
  final String transliteration;
  final String translation;
  final int repetitionCount;
  final String source;
  final List<String> tags;

  Athkar({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.arabicText,
    required this.transliteration,
    required this.translation,
    required this.repetitionCount,
    required this.source,
    required this.tags,
  });

  factory Athkar.fromJson(Map<String, dynamic> json) {
    return Athkar(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      arabicText: json['arabicText'],
      transliteration: json['transliteration'] ?? '',
      translation: json['translation'] ?? '',
      repetitionCount: json['repetitionCount'] ?? 1,
      source: json['source'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}
