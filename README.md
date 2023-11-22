# safarei_mobile
**Nama: Athira Reika**<br>
**Kelas: PBP-F**<br>
**NPM: 2206031422** <br>
**A mobile version of Safarei Park.**
[![Build status](https://build.appcenter.ms/v0.1/apps/69c9f698-c082-41d3-9df3-61e7ed39a08a/branches/main/badge)](https://appcenter.ms)

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

<details>
<summary>Pertanyaan Tugas 9</summary>
<ol>
<li>Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?<br>
Bisa. Akan tetapi, metode tersebut tidak lebih baik karena untuk data yang lebih kompleks, datanya sulit untuk dimaintain dan rawan terjadi error terkait type safety. Selain itu, apabila struktur JSON mengalami perubahan, kode dart untuk mengakses field-field yang spesifik harus diupdate satu-satu sehingga kurang efisien.
</li>
<li>Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.<br>
CookieRequest berfungsi untuk mengelola cookies untuk request HTTP dan instancenya perlu dibagikan ke semya komponen aplikasi Flutter agar HTTP request dapat dilakukan setelah autentikasi sesuai dengan cookies.
</li>
<li>Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.<br>
Flutter melakukan request HTTP GET ke URL JSON endpoint, lalu data yang diperolah akan di-parse dalam Flutter (ke dalam bentuk model apabila perlu), lalu data bisa digunakan dalam aplikasi Flutter.
</li>
<li>Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.<br>
<ul>
<li>User melakukan input data yang diminta saat login, yaitu username dan kata sandi.</li>
<li>Flutter mengirim request dengan data tersebut ke Django melalui auth/login.</li>
<li>Aplikasi Django melakukan autentikasi dengan data login dan mengirim response kembali ke Flutter.</li>
<li>Aplikasi Flutter akan menerima response. Apabila response yang diterima menyatakan user berhasil login, aplikasi Flutter akan menampilkan homepage.</li>
</ul>
</li>
<li>Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing<br>
<ul>
<li>LeftDrawer berfungsi untuk menampilkan widget drawer sebagai navigasi untuk mengakses halaman-halaman berbeda di aplikasi Flutter.</li>
<li>SizedBox berfungsi untuk membuat box dengan ukuran tetap.</li>
<li>FutureBuilder berfungsi untuk mengupdate diri sendiri sesuai data yang didapat dari snapshot terbaru.</li>
<li>ListView berfungsi untuk menyusun widget seperti list yang scrollable.</li>
<li>InkWell berfungsi untuk membuat widget yang responsif.</li>
<li>ElevatedButton dan TextButton berfungsi sebagai tombol.</li>
<li>AnimalzCard menampilkan data animal yang diinput melalui aplikasi Flutter dalam bentuk card.</li>
<li>TextFormField berfungsi untuk menerima input.</li>
</ul>
</li>
<li>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).<br>
<ul>
<li>Memastikan deployment sudah jalan</li>
<li>Membuat aplikasi dalam Django bernama authentication, menambahkannya ke INSTALLED_APPS di settings.py, dan menginstall beberapa dependencies dan melakukan konfigurasi di settings.py</li>
<li>Membuat views login dan logout di aplikasi authentikasi</li>

        from django.shortcuts import render
        from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
        from django.http import JsonResponse
        from django.views.decorators.csrf import csrf_exempt

        @csrf_exempt
        def login(request):
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    auth_login(request, user)
                    # Status login sukses.
                    return JsonResponse({
                        "username": user.username,
                        "status": True,
                        "message": "Login sukses!"
                        # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login gagal, akun dinonaktifkan."
                    }, status=401)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, periksa kembali email atau kata sandi."
                }, status=401)

        @csrf_exempt
        def logout(request):
            username = request.user.username

            try:
                auth_logout(request)
                return JsonResponse({
                    "username": username,
                    "status": True,
                    "message": "Logout berhasil!"
                }, status=200)
            except:
                return JsonResponse({
                "status": False,
                "message": "Logout gagal."
                }, status=401)
<li>Membuat screens baru bernama login.dart</li>

        import 'package:safarei_mobile/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        void main() {
            runApp(const LoginApp());
        }

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Login',
                theme: ThemeData(
                    primarySwatch: Colors.yellow,
            ),
            home: const LoginPage(),
            );
            }
        }

        class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
                final request = context.watch<CookieRequest>();
                return Scaffold(
                    appBar: AppBar(
                        title: const Text('Login'),
                    ),
                    body: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Username',
                                    ),
                                ),
                                const SizedBox(height: 12.0),
                                TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                    ),
                                    obscureText: true,
                                ),
                                const SizedBox(height: 24.0),
                                ElevatedButton(
                                    onPressed: () async {
                                        String username = _usernameController.text;
                                        String password = _passwordController.text;

                                        final response = await request.login("https://athira-reika-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                        'username': username,
                                        'password': password,
                                        });
                            
                                        if (request.loggedIn) {
                                            String message = response['message'];
                                            String uname = response['username'];
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyHomePage()),
                                            );
                                            ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                    SnackBar(content: Text("$message Selamat datang, $uname.")));
                                            } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                    title: const Text('Login Gagal'),
                                                    content:
                                                        Text(response['message']),
                                                    actions: [
                                                        TextButton(
                                                            child: const Text('OK'),
                                                            onPressed: () {
                                                                Navigator.pop(context);
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            );
                                        }
                                    },
                                    child: const Text('Login'),
                                ),
                            ],
                        ),
                    ),
                );
            }
        }

<li>Membuat models bernama Animals dalam animals.dart dari JSON</li>

        import 'dart:convert';

        List<Animal> animalFromJson(String str) => List<Animal>.from(json.decode(str).map((x) => Animal.fromJson(x)));

        String animalToJson(List<Animal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

        class Animal {
            String model;
            int pk;
            Fields fields;

            Animal({
                required this.model,
                required this.pk,
                required this.fields,
            });

            factory Animal.fromJson(Map<String, dynamic> json) => Animal(
                model: json["model"],
                pk: json["pk"],
                fields: Fields.fromJson(json["fields"]),
            );

            Map<String, dynamic> toJson() => {
                "model": model,
                "pk": pk,
                "fields": fields.toJson(),
            };
        }

        class Fields {
            int user;
            String name;
            int amount;
            String family;
            String animalClass;
            String description;
            String animalImage;

            Fields({
                required this.user,
                required this.name,
                required this.amount,
                required this.family,
                required this.animalClass,
                required this.description,
                required this.animalImage,
            });

            factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                user: json["user"],
                name: json["name"],
                amount: json["amount"],
                family: json["family"],
                animalClass: json["animal_class"],
                description: json["description"],
                animalImage: json["animal_image"],
            );

            Map<String, dynamic> toJson() => {
                "user": user,
                "name": name,
                "amount": amount,
                "family": family,
                "animal_class": animalClass,
                "description": description,
                "animal_image": animalImage,
            };
        }

<li>Memodifikasi halaman form untuk dapat melakukan POST ke aplikasi Django.</li>
<li>Membuat halaman yang dapat menampilkan data dari Django dan yang diinput lewat Flutter</li>
        import 'package:flutter/material.dart';
        import 'package:http/http.dart' as http;
        import 'dart:convert';
        import 'package:safarei_mobile/models/animals.dart';
        import 'package:safarei_mobile/screens/animal_details.dart';
        import 'package:safarei_mobile/widgets/left_drawer.dart';

        class AnimalListPage extends StatefulWidget {
            const AnimalListPage({Key? key}) : super(key: key);

            @override
            _AnimalListPageState createState() => _AnimalListPageState();
        }

        class _AnimalListPageState extends State<AnimalListPage> {
        Future<List<Animal>> fetchAnimal() async {
            var url = Uri.parse(
                'https://athira-reika-tugas.pbp.cs.ui.ac.id/json/');
            var response = await http.get(
                url,
                headers: {"Content-Type": "application/json"},
            );

            // melakukan decode response menjadi bentuk json
            var data = jsonDecode(utf8.decode(response.bodyBytes));

            // melakukan konversi data json menjadi object Animal
            List<Animal> list_animal = [];
            for (var d in data) {
                if (d != null) {
                    list_animal.add(Animal.fromJson(d));
                }
            }
            return list_animal;
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                title: const Text('Animal'),
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchAnimal(),
                    builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());
                        } else {
                            if (!snapshot.hasData) {
                            return const Column(
                                children: [
                                Text(
                                    "Tidak ada data binatang.",
                                    style:
                                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                                ],
                            );
                        } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => InkWell (
                                onTap: () {
                                    final animal = snapshot.data![index];
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AnimalDetails(animal: animal)),
                                    );
                                },
                                child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                            "${snapshot.data![index].fields.name}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text("${snapshot.data![index].fields.amount}"),
                                            // const SizedBox(height: 10),
                                            // Text("${snapshot.data![index].fields.family}"),
                                            // const SizedBox(height: 10),
                                            // Text("${snapshot.data![index].fields.animalClass}"),
                                            const SizedBox(height: 10),
                                            Text(
                                                "${snapshot.data![index].fields.description}")
                                        ],
                                        ),
                                    )));
                            }
                        }
                    }));
            }
        }
</ul>
</li>
</ol>
</details>