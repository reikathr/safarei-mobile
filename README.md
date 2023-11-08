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
<li> MyApp: Widget yang menampilkan aplikasi secara keseluruhan </li>
<li> MaterialApp: Widget yang digunakan untuk melakukan pengaturan tampilan aplikasi</li>
<li> MyHomePage: Widget yang menampilkan homepage aplikasi</li>
<li> Scaffold: Widget yang berperan sebagai kerangka visual untuk widget lain</li>
<li> AppBar: Widget yang berperan sebagai bar di atas aplikasi </li>
<li> Text: Widget yang menampilkan teks</li>
<li> Padding: Widget yang menyediakan padding</li>
<li> Column: Widget yang menampilkan anaknya secara vertikal</li>
<li> GridView: Widget yang menampilkan anaknya dalam bentuk grid</li>
<li> InventoryCard: Widget card yang menampilkan objek dari class InventoryItem</li>
<li> SnackBar: Widget yang memunculkan teks sebagai pop-up di bawah layar</li>
<li> Container: Widget yang menggabungkan berbagai widget painting, positioning, dan sizing</li>
<li> Center: Widget yang menempatkan anak-anaknya di tengah</li>
<li> Icon: Widget yang menampilkan simbol</li>
<br>
3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
<br>
<li>Membuka direktori safarei_mobile dan menjalankan `flutter create safarei_mobile` dan `cd safarei_mobile` di terminal</li><br>
<li>Membuka folder lib lalu membuat berkas baru bernama `menu.dart` yang berisi `import 'package:flutter/material.dart';` dan menambahkan kode `import 'package:safarei_mobile/menu.dart';` ke `main.dart`.</li><br>
<li>Memindahkan class MyHomePage dari `main.dart` ke `menu.dart` dan menggantikan widgetnya dari StatefulWidget menjadi StatelessWidget. Dalam proses ini, melakukan modifikasi pada kode dalam main.dart dan menu.dart untuk menyesuaikan dengan perubahan tersebut seperti menghilangkan fungsi state dalam class MyHomePage.</li><br>
<li>Membuat kelas InventoryItem di `menu.dart` seperti berikut:</li>

    class InventoryItem {
    final String name;
    final IconData icon;
    final Color color;

    InventoryItem(this.name, this.icon, this.color);
    }

<li>Memodifikasi MyHomePage menjadi seperti berikut:</li>

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

<li>Membuat class InventoryCard di `menu.dart`</li>

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