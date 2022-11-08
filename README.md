## Stateless Widget dan Stateful Widget

- Stateless widget adalah widget yang tidak memiliki state. Perubahan dari stateless widget hanya bergantung dari parent widget tersebut.

- Stateful widget adalah widget yang memiliki state. Widget tersebut dapat berubah secara dinamis. Widget tersebut bersifat immutable, tetapi memiliki object State yang menyimpan state widget tersebut.

- Perbedaan dari stateless dan stateful widget adalah stateless widget tidak memiliki object State, sedangkan stateful widget sebaliknya.

## Widget yang Digunakan

- Scaffold: menyimpan widget-widget yang akan ditampilkan
- AppBar: menampilkan judul aplikasi
- Center: menempatkan child yang dimilikinya di tengah
- Column: menempatkan children yang dimilikinya secara vertikal
- MainAxisAlignment: mengatur posisi penempatan widget
- Row: menempatkan children yang dimilikinya secara horizontal
- Padding: memberikan padding pada child widget
- EdgeInsets: memberikan detail padding
- Visibility: menampilkan/menyembunyikan widget
- FloatingActionButton: tombol yang dapat ditekan user
- Icon: ikon yang ditampilkan pada tombol

## Fungsi dari setState()
setState() berfungsi untuk merubah internal state dari object State yang kita gunakan.

## Perbedaan const dan final
const adalah konstan yang nilainya ditentukan saat compile-time, sedangkan final adalah konstan yang nilainya ditentukan saat runtime.

## Implementasi Checklist
- Membuat fungsi untuk mengurangi counter (_decrementCounter())
- Menambahkan tombol yang memanggil fungsi pada poin 1 ketika ditekan (FloatingActionButton)
- Membuat state baru, yaitu string _parity yang menyimpan paritas dari counter
- Menentukan teks yang ditampilkan (GANJIL/GENAP) dan warna teks tersebut (merah/biru) berdasarkan string _parity
- Memberikan padding pada tombol di poin 2 agar tidak keluar dari layar menggunakan Padding() dan EdgeInsets()
- Menentukan apakah tombol di poin 2 ditampilkan berdasarkan nilai _counter menggunakan Visibility()