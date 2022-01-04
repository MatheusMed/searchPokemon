import 'dart:convert';

class Pokemon {
  final String name;
  final String imagem;

  Pokemon({
    required this.name,
    required this.imagem,
  });

  Pokemon copyWith({
    String? name,
    String? imagem,
  }) {
    return Pokemon(
      name: name ?? this.name,
      imagem: imagem ?? this.imagem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imagem': imagem,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'],
      imagem: map['sprites']['front_default'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  String toString() => 'Pokemon(name: $name, imagem: $imagem)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pokemon && other.name == name && other.imagem == imagem;
  }

  @override
  int get hashCode => name.hashCode ^ imagem.hashCode;
}
