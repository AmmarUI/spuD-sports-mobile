import 'package:flutter/material.dart';
import 'package:spud_sports/widgets/side_drawer.dart';
import 'package:flutter/services.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _categories = [
    'shoes',
    'balls',
    'jerseys',
    'socks',
    'shorts',
  ];

  //function to check if URL is valid
  bool isValidUrl(String urlString) {
    try {
      final uri = Uri.parse(urlString);
      return uri.isAbsolute;
    } catch (e) {
      return false; // Parsing failed, so it's not a valid URL
    }
  }

  String _name = "";
  String _description = "";
  String _category = "balls";
  String _thumbnail = "";
  int _stock = 0;
  int _price = 0;
  bool _isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),

      drawer: SideDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === PRODUCT NAME ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Product Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),

                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },

                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === DESCRIPTION ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Product Description",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),

                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },

                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === CATEGORY ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat[0].toUpperCase() + cat.substring(1)),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === THUMBNAIL URL ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Insert URL for thumbnail (optional)",
                    labelText: "Product Thumbnail",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),

                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },

                  validator: (String? value) {
                    String nonEmptyValue = "";
                    if (value == null || value.isEmpty) {
                      return null;
                    }else{
                      nonEmptyValue = value;
                      if (!isValidUrl(nonEmptyValue)) {
                        return "Please Enter a Valid URL";
                      }
                    }

                    return null;
                  },
                ),
              ),

              // === STOCK ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Stok Produk",
                    labelText: "Product Stock",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),

                  //numpad keyboard shows up
                  keyboardType: TextInputType.number,

                  //formatting for number only
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value ?? '0') ?? 0;
                    });
                  },

                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Stok produk tidak boleh kosong!";
                    }

                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Masukkan angka yang valid!";
                    }

                    if (parsedValue <= 0) {
                      return "Stok tidak boleh 0 atau negatif!";
                    }

                    return null;
                  },
                ),
              ),

              // === PRICE ===
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harge Produk",
                    labelText: "Product Price",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),

                  //numpad keyboard shows up
                  keyboardType: TextInputType.number,

                  //formatting for number only
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],

                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value ?? '0') ?? 0;
                    });
                  },

                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga produk tidak boleh kosong!";
                    }

                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Masukkan angka yang valid!";
                    }

                    if (parsedValue <= 0) {
                      return "Harga tidak boleh 0 atau negatif!";
                    }

                    return null;
                  },
                ),
              ),

              // === SAVE BUTTON ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil disimpan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name : $_name'),
                                    Text('Description : $_description'),
                                    Text('Thumbnail URL : $_thumbnail'),
                                    Text('Stock : $_stock'),
                                    Text('Price : $_price'),
                                    Text('Featured : $_isFeatured'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
