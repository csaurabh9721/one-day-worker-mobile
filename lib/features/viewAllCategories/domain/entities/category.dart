class Category {
  final String id;
  final String name;
  final String imageUrl;
  final String iconCodePoint;
  final List<double> gradientColors;
  final int workerCount;
  final bool isAvailable;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.iconCodePoint,
    required this.gradientColors,
    required this.workerCount,
    this.isAvailable = true,
  });

  Category copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? iconCodePoint,
    List<double>? gradientColors,
    int? workerCount,
    bool? isAvailable,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      gradientColors: gradientColors ?? this.gradientColors,
      workerCount: workerCount ?? this.workerCount,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.iconCodePoint == iconCodePoint &&
        other.workerCount == workerCount &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        iconCodePoint.hashCode ^
        workerCount.hashCode ^
        isAvailable.hashCode;
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, workerCount: $workerCount, isAvailable: $isAvailable)';
  }
}
