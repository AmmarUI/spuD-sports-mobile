# Football Shop 🏟️⚽  
#### Nama : *Abdurrahman Ammar Abqary*  
#### NPM : *2406495994*  
#### Kelas : *PBP D*  

---

## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent–child bekerja antar widget

- **Widget tree** adalah struktur hierarki dalam Flutter yang menggambarkan bagaimana widget saling tersusun dari atas ke bawah.
- Setiap bagian UI tersusun dari widget yang saling terhubung, membentuk tree.
- Terdapat hubungan **parent–child (induk–anak)**:
  - *Parent* membungkus dan mengatur child
  - *Child* adalah widget yang berada di dalam parent dan mengikuti layout parent

Contoh:  
Scaffold → Body → GridView → Card → Icon/Text

Widget tree membantu Flutter mengetahui bagaimana menampilkan dan mengupdate UI.

## 2. Sebutkan semua widget yang digunakan dalam proyek ini dan jelaskan fungsinya

| Widget | Fungsi |
|---|---|
| `MaterialApp` | Root aplikasi, mengatur tema & navigasi |
| `Scaffold` | Struktur dasar halaman (AppBar, body) |
| `AppBar` | Menampilkan judul di bagian atas layar |
| `Padding` | Memberi jarak di sekitar widget |
| `Center` | Memposisikan widget di tengah |
| `GridView.count` | Menampilkan item dalam bentuk grid (3 kolom) |
| `Material` | Memberikan efek Material Design (background & ripple) |
| `InkWell` | Memberikan animasi klik (ripple) & menangani tap |
| `Container` | Pembungkus layout untuk padding & styling |
| `Column` | Menyusun widget secara vertikal |
| `Icon` | Menampilkan ikon pada tombol |
| `Text` | Menampilkan teks label |
| `SnackBar` | Menampilkan notifikasi di bawah layar |
| `ScaffoldMessenger` | Mengontrol SnackBar & memanggilnya |

Semua widget ini membentuk UI Football Shop yang interaktif.

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root

`MaterialApp` berfungsi untuk:

- Mengaktifkan Material Design pada aplikasi Flutter
- Mengatur tema, font, warna aplikasi
- Menyediakan sistem navigasi & routing
- Menjadi pondasi untuk widget lain seperti `Scaffold`, `SnackBar`, dll.

Digunakan sebagai **widget root** karena hampir semua fitur UI Material Flutter membutuhkannya agar berjalan dengan benar.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

| StatelessWidget | StatefulWidget |
|---|---|
| Tidak memiliki state yang berubah | Memiliki state yang bisa berubah |
| UI tidak berubah saat runtime | UI dapat berubah sesuai interaksi/user input |
| Lebih ringan & cepat | Lebih kompleks & menggunakan memory lebih |

### Kapan digunakan
- **StatelessWidget** → UI statis, hanya menampilkan data
- **StatefulWidget** → UI dinamis, butuh update berdasarkan event (input, fetch data, animasi)

Pada tugas ini, digunakan **StatelessWidget** karena tombol hanya menampilkan SnackBar tanpa mengubah state aplikasi.

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build

- `BuildContext` adalah objek yang memberi informasi tentang posisi widget dalam tree
- Penting untuk:
  - Mengakses theme (`Theme.of(context)`)
  - Menampilkan SnackBar (`ScaffoldMessenger.of(context)`)
  - Navigasi antar halaman
- Digunakan oleh metode `build(context)` untuk membangun UI berdasarkan lokasi widget dalam tree.

Contoh:
```dart
ScaffoldMessenger.of(context).showSnackBar(...)
