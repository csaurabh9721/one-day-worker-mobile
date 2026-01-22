class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final String iconCodePoint;
  final List<double> gradientColors;
  final int workerCount;
  final bool isAvailable;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.iconCodePoint,
    required this.gradientColors,
    required this.workerCount,
    this.isAvailable = true,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image'] as String? ?? '',
      iconCodePoint: json['iconCodePoint'] as String? ?? '',
      gradientColors: List<double>.from(json['gradient'] as List? ?? [0.0, 0.0]),
      workerCount: int.parse(json['count'] as String? ?? '0'),
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': imageUrl,
      'iconCodePoint': iconCodePoint,
      'gradient': gradientColors,
      'count': workerCount.toString(),
      'isAvailable': isAvailable,
    };
  }

  CategoryModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? iconCodePoint,
    List<double>? gradientColors,
    int? workerCount,
    bool? isAvailable,
  }) {
    return CategoryModel(
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
    return other is CategoryModel &&
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
}
