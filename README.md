# safarei_mobile
**Nama: Athira Reika**<br>
**Kelas: PBP-F**<br>
**NPM: 2206031422** <br>
**A mobile version of Safarei Park.**

<details>
<summary>Tugas 7</summary>
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?<br>
Stateless widget adalah widget yang tidak akan pernah dan tidak bisa berubah. Stateful widget adalah widget yang dapat berubah akibat interaksi pengguna dengan widget tersebut atau perubahan data.
<br><br>
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
<li>Membuka direktori safarei_mobile dan menjalankan <code>flutter create safarei_mobile</code> dan <code>cd safarei_mobile</code> di terminal</li><br>
<li>Membuka folder lib lalu membuat berkas baru bernama <code>menu.dart</code> yang berisi <code>import 'package:flutter/material.dart';</code> dan menambahkan kode<code> import 'package:safarei_mobile/menu.dart';</code> ke <code>main.dart</code>.</li><br>
<li>Memindahkan class MyHomePage dari <code>main.dart</code> ke <code>menu.dart</code> dan menggantikan widgetnya dari StatefulWidget menjadi StatelessWidget. Dalam proses ini, melakukan modifikasi pada kode dalam main.dart dan menu.dart untuk menyesuaikan dengan perubahan tersebut seperti menghilangkan fungsi state dalam class MyHomePage.</li><br>
<li>Membuat kelas InventoryItem di <code>menu.dart</code> seperti berikut:</li>

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

<li>Membuat class InventoryCard di <code>menu.dart</code></li>

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
</details>

<details>
<summary>Tugas 8</summary>
<ol>
<li> Jelaskan perbedaan antara <code>Navigator.push()</code> dan <code>Navigator.pushReplacement()</code>, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!<br>
<ul>
<li><code>Navigator.push()</code> digunakan ketika kita ingin menuju halaman lain dan ketika tombol kembali diklik, kita akan kembali ke halaman yang kita buka tepat sebelum kita ke halaman yang sekarang. Contoh: Dari halaman menu ke halaman lihat item, kita dapat menggunakan <code>Navigator.push()</code> sehingga pada <i>stack</i>, halaman menu berada di bawah halaman lihat item dan ketika kita meng-klik kembali dari halaman lihat item, kita akan kembali ke halaman menu.
</li>
<li><code>Navigator.pushReplacement()</code> digunakan ketika kita ingin menuju halaman lain tetapi ketika tombol kembali diklik, kita tidak dapat kembali ke halaman sebelumnya. Contoh: Dari halaman login ke halaman menu, kita dapat menggunakan <code>Navigator.pushReplacement()</code> sehingga pada <i>stack</i>, halaman login <i>digantikan</i> posisinya (dan hilang dari <i>stack</i>) oleh halaman menu dan ketika kita meng-klik kembali dari halaman menu, kita tidak dapat kembali ke halaman login.
</li>
</ul>
</li>

<li>Jelaskan masing-masing <i>layout</i> widget pada Flutter dan konteks penggunaannya masing-masing!
<ul>
<li><b>Single-child layout widgets:</b> Widget yang hanya memiliki satu anak, sehingga digunakan ketika perlu mengatur posisi dari satu widget tertentu. Contoh: Align, Baseline, Center, Container, Padding, dll.</li>
<li><b>Multi-child layout widgets:</b> Widget yang bisa memiliki beberapa anak dan digunakan ketika perlu mengatur posisi beberapa widget dalam satu tempat. Contoh: Column, Flow, GridView, Row, Stack, dll.</li>
<li><b>Sliver widgets:</b> Widget yang merupakan bagian dari area <i>scrollable</i> yang bisa memiliki beberapa anak. Contoh: CustomScrollView, SliverAppBar, SliverGrid, SliverList, dll.</li>
</ul>
</li>
<li>Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut! <br>
Elemen input yang saya pakai pada tugas ini hanya TextFormField karena field yang saya perlukan hanya yang berupa teks dan TeztFormField memiliki validasi <i>built-in</i> untuk inputnya.
</li><br>
<li>Bagaimana penerapan clean architecture pada aplikasi Flutter?<br>
File dalam folder <code>lib</code> dibagi menjadi beberapa folder lagi, yaitu folder <code>screens</code> yang menyimpan halaman atau "layar" berbeda yang akan ditampilkan dan folder <code>widgets</code> yang berisi pengaturan untuk widget yang dapat ditampilkan di beberapa halaman.
</li><br>
<li>Jelaskan bagaimana cara kamu mengimplementasikan <i>checklist</i> di atas secara <i>step-by-step</i>!<br>
<ul>
<li>Membuat folder <code>screens</code> dan <code>widgets</code> lalu memasukkan berkas <code>menu.dart</code> ke folder <code>screens</code>.</li>
<li>Membuat berkas baru di <code>screens</code> bernama <code>safarei_form.dart</code> dengan isi sebagai berikut

    import 'package:flutter/material.dart';
    import 'package:safarei_mobile/widgets/left_drawer.dart';
    import 'package:safarei_mobile/widgets/animal_card.dart';

    List<Animal> animals = [];

    class SafareiFormPage extends StatefulWidget {
        const SafareiFormPage({super.key});

        @override
        State<SafareiFormPage> createState() => _SafareiFormPageState();
    }

    class _SafareiFormPageState extends State<SafareiFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _amount = 0;
        String _family = "";
        String _animalClass = "";
        String _description = "";
        @override
        Widget build(BuildContext context) {
        return Scaffold(
            ...
                children: [
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _name = value!;
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Name cannot be empty!";
                        }
                        return null;
                        },
                    ),
                    ... other inputs
                    ),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            animals.add(Animal(_name, _amount, _family, _animalClass, _description));
                            ...
                                },
                            );
                            _formKey.currentState!.reset();
                            }
                        },
                        child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                        ),
                        ),
                    ),
                    ),
                ]
            ),
        }
    }
</li>
<li>Memindahkan kode InventoryItem dan InventoryCard dari <code>menu.dart</code> ke sebuah berkas baru bernama <code>safarei_card.dart</code> di folder <code>widgets</code>. Dalam berkas tersebut, terdapat <i>import</i> untuk <code>menu.dart</code> dan berkas screens lain bernama <code>safarei_form.dart</code> untuk halaman formnya (untuk routing).</li>
<li>Menambahkan kode berikut dalam method build di <code>widgets/safarei_card.dart</code>

    ...
    onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
                    if (item.name == "Tambah Item") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SafareiFormPage()));
                    }
            },
    ...
</li>
<li>Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru dengan menambahkan kode ini di <code>screens/safarei_form.dart</code>

    ...
    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          animals.add(Animal(_name, _amount, _family, _animalClass, _description));
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Item berhasil tersimpan'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Amount: $_amount'),
                                      Text('Family: $_family'),
                                      Text('Class: $_animalClass'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
    ...
</li>
<li>Membuat berkas <code>left_drawer.dart</code> di folder <code>widgets</code> dengan isi sebagai berikut:

    import 'package:flutter/material.dart';
    import 'package:safarei_mobile/screens/menu.dart';
    import 'package:safarei_mobile/screens/safarei_form.dart';
    import 'package:safarei_mobile/screens/safarei_animalpage.dart';

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                color: Colors.black,
                ),
                child: Column(
                children: [
                    Text(
                    'Safarei',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Archive your favorite animals here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white, // Set the text color to white
                    ),
                    ),
                ],
                ),
            ),
                ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Halaman Utama'),
                // Bagian redirection ke MyHomePage
                onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                        ));
                },
                ),
                ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Tambah Item'),
                onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SafareiFormPage()));
                },
                ),
            ],
        ),
        );
    }
    }

</li>
<li>Menambahkan drawer ke dalam method build di <code>screens/safarei_form.dart</code> dan <code>screens/menu.dart</code> seperti berikut:
    
    import 'package:safarei_mobile/widgets/left_drawer.dart';
    ...
    return Scaffold(
            appBar: AppBar(
            title: const Center(
                child: Text(
                ...
                ),
            ),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
    ...
</li>
</ul>
</li>
</ol>
</details>