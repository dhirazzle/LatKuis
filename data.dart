// ============================================
// MODEL USER (untuk login)
// ============================================
class User {
  String username;
  String password;
  String nama;

  User({
    required this.username,
    required this.password,
    required this.nama,
  });
}

// Data dummy user
final User user1 = User(
  username: 'budi123',
  password: 'password123',
  nama: 'Budi Doremi',
);

// ============================================
// MODEL ITEM (untuk list di home)
// ============================================
class Item {
  final String nama;
  final String deskripsi;
  final String imageUrl;
  final int harga;
  int quantity;   // ← bisa diubah

  Item({
    required this.nama,
    required this.deskripsi,
    required this.imageUrl,
    required this.harga,
    required this.quantity,
  });

  // Getter: total harga
  int get totalPrice => quantity * harga;

  // Getter: format harga
  String get formattedPrice => formatPrice(harga);
  String get formattedTotal => formatPrice(totalPrice);

  // Data dummy
  static final List<Item> sampleData = [
    Item(
      nama: 'Item 1',
      deskripsi: 'Deskripsi item 1',
      imageUrl: 'https://contoh.com/gambar1.jpg',
      harga: 15000,
      quantity: 0,
    ),
    Item(
      nama: 'Item 2',
      deskripsi: 'Deskripsi item 2',
      imageUrl: 'https://contoh.com/gambar2.jpg',
      harga: 12000,
      quantity: 0,
    ),
    Item(
      nama: 'Item 3',
      deskripsi: 'Deskripsi item 3',
      imageUrl: 'https://contoh.com/gambar3.jpg',
      harga: 25000,
      quantity: 0,
    ),
  ];
}

// ============================================
// FUNGSI FORMAT RUPIAH
// ============================================
String formatPrice(int value) {
  return value.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'),
        (m) => '${m[1]}.',
      );
}
