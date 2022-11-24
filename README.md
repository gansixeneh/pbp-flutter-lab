# Tugas 7

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

# Tugas 8

## Perbedaan Navigator.push dan Navigator.pushReplacement
Pada flutter, struktur yang digunakan untuk navigasi adalah stack. Navigator.push menambah screen baru pada stack tersebut, sedangkan Navigator.pushReplacement juga melakukan penghapusan screen paling atas pada stack ketika screen baru yang ditambahkan sudah dapat ditampilkan.

## Widget yang Digunakan

- Scaffold: menyimpan widget-widget yang akan ditampilkan
- AppBar: menampilkan judul aplikasi
- Column: menempatkan children yang dimilikinya secara vertikal
- MainAxisAlignment: mengatur posisi penempatan widget
- Row: menempatkan children yang dimilikinya secara horizontal
- Padding: memberikan padding pada child widget
- EdgeInsets: memberikan detail padding
- Form: form yang dapat meminta dan menyimpan data yang diberikan user
- Container: membungkus widget-widget yang ada di dalamnya
- InputDecoration: mendekorasi input pada form
- OutlineInputBorder: memberikan outline pada kotak input berbentuk rounded rectangle
- DropdownButtonHideUnderline: menyembunyikan underline pada dropdown
- Spacer: memberikan spacing agar widget selanjutnya ada di paling bawah
- DropdownButton: tombol dropdown
- DropdownMenuItem: item-item yang ditampilkan ketika tombol dropdown ditekan
- TextButton: teks yang dapat di-klik (untuk melakukan submit)
- ButtonStyle: memberikan style pada TextButton
- MaterialStateProperty: membuat text button selalu berwarna biru (menggunakan all())
- Text: menampilkan teks
- TextStyle: memberikan style pada teks
- Card: menampilkan card
- ListTile: menampilkan teks pendek dengan judul dan penjelasan
- Drawer: tombol yang dapat ditekan untuk navigasi
- Navigator: mengatur screen yang ditampilkan
- MaterialPageRoute: melakukan routing pada screen tertentu

## Jenis-jenis Event pada Flutter

- onTap: melakukan prosedur tertentu ketika suatu widget ditekan
- onChanged: melakukan prosedur tertentu ketika isi TextField berubah
- onSaved: melakukan prosedur tertentu ketika method _formKey.currentState.save() dipanggil
- onPressed: melakukan prosedur tertentu ketika suatu widget diklik

## Cara kerja Navigator dalam "mengganti" halaman

Struktur penyimpanan Navigator adalah stack yang menyimpan Route, yaitu screen yang dapat ditampilkan. Navigator menampilkan screen yang ada di paling atas stack. Untuk melakukan perubahan pada screen yang ditampilkan, Navigator melakukan push (menambah screen baru di bagian atas) atau pop (menghapus screen paling atas).

## Implementasi Checklist

- Menambahkan drawer/hamburger menggunakan Drawer() yang dapat melakukan routing ke setiap screen yang ada ketika ditekan, yaitu menggunakan onTap(), Navigator.pushReplacement(), dan MaterialPageRoute()

- Membuat Form() yang berisi TextFormField(). Agar input yang diberikan selalu integer, diberikan constraint keyboardType: TextInputType.number. Data-data pada field disimpen pada variabel tertentu.

- Membuat dropdown dan menyediakan pilihan "Pemasukan" dan "Pengeluaran". Pilihan user juga akan disimpan dalam suatu variabel.

- Membuat TextButton yang memasukkan data-data yang ada pada form dalam suatu List.

- Menampilkan List menggunakan ListView. Setiap index akan menampilkan Card yang berisi ListTile. Setiap ListTile akan menampilkan judul sebagai title, serta tipe dan nominal budget pada subtitle. Font dari judul diubah menggunakan TextStyle, sedangkan opacity dari tipe dan nominal budget juga diubah menggunakan TextStyle.

- Agar tipe dan nominal budget ditampilkan sejajar, digunakan widget Row().


# Tugas 9

## Pengambilan Data JSON tanpa Model

Ya, pengambilan data tetap bisa dilakukan tanpa pembuatan model. Tetapi, pembuatan model lebih direkomendasikan, karena dapat mempermudah pemrosesan data JSON yang diambil.

## Widget yang Digunakan

- TextStyle: mengatur style teks (bold, size, dll)
- BoxDecoration: memberikan dekorasi pada box
- Checkbox: checkbox yang dapat dicentang
- SizedBox: mengatur ukuran box (agar dapat melebar)
- ColoredBox: mewarnai box
- FutureBuilder: Widget yang melakukan build sesuai dengan snapshot terakhir suatu Future
- TextButton: button yang berisi teks
- ListView: menampilkan beberapa widget secara berurutan
- RichText: menampilkan teks yang rich (memiliki style yang berbeda-beda)
- TextSpan: menampilkan teks dengan style yang berbeda-beda dalam satu line
- DateFormat: mengubah format dari suatu tanggal

## Mekanisme Pengambilan Data JSON

- Membuat Models yang sesuai dengan data yang akan diambil
- Membuat fungsi yang dapat mengubah data JSON menjadi sesuai dengan Models, dan sebaliknya.

## Implementasi Checklist

- Membuat mywatchlist.dart pada folder model yang dapat memproses data JSON yang akan diambil dari server
- Membuat fungsi fetch yang dapat memproses data JSON dari server menjadi sebuah list pada mywatchlist_fetch.dart
- Menampilkan data yang sudah di-fetch menggunakan ListView pada mywatchlist_page.dart
- Membuat page pada mywatchlist_detail.dart yang akan menampilkan detail data. Page tersebut akan diakses ketika ListTile pada mywatchlist_page.dart ditekan dan akan menerima argumen fields yang akan ditampilkan.