# Football Shop 🏟️⚽  
#### Nama : *Abdurrahman Ammar Abqary*  
#### NPM : *2406495994*  
#### Kelas : *PBP D*  

### History README Tugas:

- [***Tugas 7***](https://github.com/AmmarUI/spuD-sports-mobile/wiki/README-Tugas-7)

---

## 1. Perbedaan `Navigator.push()` vs `Navigator.pushReplacement()` dan kapan dipakai di Football Shop

- **`Navigator.push()`**
  - Menambahkan rute baru ke **atas** tumpukan (stack) navigator.
  - Pengguna dapat kembali ke halaman sebelumnya dengan `Navigator.pop()` atau tombol *back*.
  - **Kapan pakai:** saat membuka halaman yang bersifat sementara/detail dan pengguna wajar untuk kembali (contoh: halaman detail produk, preview gambar, halaman checkout step yang masih bisa dibatalkan).

- **`Navigator.pushReplacement()`**
  - Mengganti rute saat ini dengan rute baru — rute lama **dihapus** dari stack.
  - Tidak memungkinkan kembali ke halaman sebelumnya (kecuali rute lain menaruhnya kembali ke stack).
  - **Kapan pakai:** saat navigasi bersifat final atau menggantikan flow (contoh: pindah dari splash/login ke home).  

**Pada Aplikasi spuD Sports:**  
- Gunakan `pushReplacement` pada navigasi global dari Drawer agar user tidak menumpuk rute ketika berpindah antar halaman utama.  
- Gunakan `push` saat membuka create product dari halaman utama.

---

## 2. Memanfaatkan hierarchy widget (`Scaffold`, `AppBar`, `Drawer`) untuk struktur halaman konsisten

- **Prinsip:** buat struktur halaman dasar yang sama di setiap layar utama supaya pengalaman konsisten (AppBar + Drawer + body).  
- **Cara praktis:**
  - Tempatkan `Scaffold` sebagai parent pada setiap *screen* utama.
  - `AppBar` untuk judul, aksi global (search, cart), dan konsistensi warna/ikon.
  - `Drawer` untuk navigasi global (menu, profile, logout). `SideDrawer()` dipasang ke `drawer` di `Scaffold` sehingga setiap halaman yang memakai `Scaffold` & `SideDrawer` akan memperoleh menu yang sama.
- **Keuntungan:** pengguna selalu tahu di mana menemukan menu dan kembali ke home; memudahkan perubahan global (ganti warna AppBar di satu tempat berpengaruh ke banyak layar).
- **Contoh (di `add_product_form.dart`):**
  ```dart
  return Scaffold(
    appBar: AppBar(
      title: const Center(child: Text('Add Product Form')),
      backgroundColor: Colors.deepPurpleAccent,
    ),
    drawer: SideDrawer(),
    body: Form(...),
  );
  ```

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

- **`Padding`**  
  Widget ini digunakan untuk memberikan jarak di sekitar elemen, membuat tampilan form terlihat rapi dan mudah dibaca. Tanpa `Padding`, teks dan input field akan terlalu menempel ke tepi layar, yang dapat mengurangi kenyamanan pengguna.  
  *Contoh:*  
  Pada file `add_product_form.dart`, setiap `TextFormField` dibungkus dengan `Padding(padding: const EdgeInsets.all(8), child: ...)` untuk menjaga jarak antar elemen form.

- **`SingleChildScrollView`**  
  Digunakan agar konten dapat di-*scroll* ketika ruang layar tidak cukup untuk menampilkan seluruh elemen form. Ini sangat penting ketika keyboard muncul atau pada perangkat dengan layar kecil.  
  *Contoh:*  
  Di dalam `ProductFormPage`, seluruh form ditempatkan di dalam `SingleChildScrollView`, sehingga pengguna dapat menggulir ke bawah untuk mengisi semua field tanpa terjadi overflow:
  ```dart
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...],
      ),
    ),
  )
  ```
- **`ListView`**
  Alternatif dari `SingleChildScrollView` dan `Column` yang lebih efisien untuk menampilkan banyak elemen atau daftar form yang dinamis. `ListView` hanya merender elemen yang terlihat di layar, sehingga performa tetap optimal meskipun jumlah field bertambah banyak.
  Ini belum diimplementasikan pada aplikasi spuD Sports.

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Untuk menciptakan identitas visual yang konsisten pada aplikasi Football Shop, warna tema perlu diatur secara global agar setiap halaman memiliki nuansa dan gaya yang seragam. Flutter menyediakan `ThemeData` di dalam `MaterialApp` untuk mengatur hal ini.

- **Gunakan `ThemeData` untuk mendefinisikan warna utama aplikasi**  
  Dengan menggunakan `colorScheme` atau `primaryColor`, seluruh elemen seperti `AppBar`, `Button`, dan `Drawer` akan mengikuti warna tema yang sama. Ini menjaga konsistensi visual di seluruh halaman.

- **Definisikan warna brand di satu tempat**  
  Misalnya, jika brand Football Shop menggunakan warna ungu sebagai warna utama, maka semua elemen seperti AppBar, tombol, dan Drawer dapat mengacu pada warna tersebut.

- **Terapkan warna tema pada komponen utama**  
  Contohnya, `AppBar` menggunakan warna brand sebagai latar belakang, dan teksnya berwarna putih untuk menjaga kontras yang baik. Begitu juga dengan `DrawerHeader` yang dapat menggunakan warna yang sama agar terasa menyatu dengan tema keseluruhan aplikasi.

📌 *Contoh penerapan di kode:*
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spuD Sports',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.redAccent),
      ),
      home: MyHomePage(),
    );
  }
}
```

