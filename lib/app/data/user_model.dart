class User {
  int? id;
  String? nama;
  int? umur;

  User({
    this.id,
    this.nama,
    this.umur
  });

  User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nama: json['nama'],
      umur: json['umur'].toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'umur': umur
    };
  }
}
