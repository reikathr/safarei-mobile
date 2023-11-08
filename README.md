# safarei_mobile
Nama: Athira Reika
Kelas: PBP-F
NPM: 2206031422
A mobile version of Safarei Park.

# Tugas 7
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
<br>
Stateless widget adalah widget yang tidak akan pernah dan tidak bisa berubah. Stateful widget adalah widget yang dapat berubah akibat interaksi pengguna dengan widget tersebut atau perubahan data.
<br>
2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
<br>
<ul> MyApp: Widget yang menampilkan aplikasi secara keseluruhan </ul>
<ul> MaterialApp: Widget yang digunakan untuk melakukan pengaturan tampilan aplikasi</ul>
<ul> MyHomePage: Widget yang menampilkan homepage aplikasi</ul>
<ul> Scaffold: Widget yang berperan sebagai kerangka visual untuk widget lain</ul>
<ul> AppBar: Widget yang berperan sebagai bar di atas aplikasi </ul>
<ul> Text: Widget yang menampilkan teks</ul>
<ul> Padding: Widget yang menyediakan padding</ul>
<ul> Column: Widget yang menampilkan anaknya secara vertikal</ul>
<ul> GridView: Widget yang menampilkan anaknya dalam bentuk grid</ul>
<ul> InventoryCard: Widget card yang menampilkan objek dari class InventoryItem</ul>
<ul> SnackBar: Widget yang memunculkan teks sebagai pop-up di bawah layar</ul>
<ul> Container: Widget yang menggabungkan berbagai widget painting, positioning, dan sizing</ul>
<ul> Center: Widget yang menempatkan anak-anaknya di tengah</ul>
<ul> Icon: Widget yang menampilkan simbol</ul>
<br>
3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
<br>
- Membuka direktori safarei_mobile dan menjalankan `flutter create safarei_mobile` dan `cd safarei_mobile` di terminal
- Membuka folder lib lalu membuat berkas baru bernama `menu.dart` yang berisi `import 'package:flutter/material.dart';` dan menambahkan kode `` ke `main.dart`.
- Memindahkan class MyHomePage dari `main.dart` ke `menu.dart` dan menggantikan widgetnya dari StatefulWidget menjadi StatelessWidget. Dalam proses ini, melakukan modifikasi pada kode dalam main.dart dan menu.dart untuk menyesuaikan dengan perubahan tersebut seperti menghilangkan fungsi state dalam class MyHomePage.
- Membuat kelas InventoryItem di `menu.dart` seperti berikut:
```
class InventoryItem {
  final String name;
  final IconData icon;
  final Color color;

  InventoryItem(this.name, this.icon, this.color);
}
```
- Memodifikasi MyHomePage menjadi seperti berikut:
```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<InventoryItem> items = [
        InventoryItem("Lihat Item", Icons.checklist, const Color.fromARGB(255, 114, 101, 238)),
        InventoryItem("Tambah Item", Icons.add, const Color.fromARGB(255, 236, 88, 78)),
        InventoryItem("Logout", Icons.logout, const Color.fromARGB(255, 239, 224, 85)),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safarei',
          style: TextStyle(
            color: Colors.white,
          )
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Safarei Park', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  // Iterasi untuk setiap item
                  return InventoryCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    }
}
```
- Membuat class InventoryCard di `menu.dart`
```
class InventoryCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```