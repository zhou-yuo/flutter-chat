class Datum {
  String? category;
  String? icon;
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  Datum({
    this.category,
    this.icon,
    this.id,
    this.link,
    this.name,
    this.order,
    this.visible,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        category: json['category'] as String?,
        icon: json['icon'] as String?,
        id: json['id'] as int?,
        link: json['link'] as String?,
        name: json['name'] as String?,
        order: json['order'] as int?,
        visible: json['visible'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'icon': icon,
        'id': id,
        'link': link,
        'name': name,
        'order': order,
        'visible': visible,
      };
}
