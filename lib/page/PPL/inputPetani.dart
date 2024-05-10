import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_word_1/models/errMsg.dart';
import 'package:hello_word_1/models/kelompok.dart';
import 'package:hello_word_1/models/petani.dart';
//import 'package:hello_word_1/page/petaniPage.dart';
import 'package:hello_word_1/service/apiStatic.dart';
// Import ApiService

class InputPetani extends StatefulWidget {
  final Petani petani;
  InputPetani({required this.petani});
  @override
  _InputPetaniState createState() => _InputPetaniState();
}

class _InputPetaniState extends State<InputPetani> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController nama, nik, alamat, telp;
  late List<KelompokPetani> _kelompok = [];
  late int idKelompok = 0;
  late int idPenjual = 0;
  bool _isupdate = false;
  bool _validate = false;
  bool _success = false;
  ErrorMSG? response; // Deklarasi response sebagai nullable
  late String _status = 'N';
  late String _imagePath = "";
  late String _imageURL = "";

  void getKelompok() async {
    final kelompokList = await APiService.getKelompokTani();
    setState(() {
      _kelompok = kelompokList;
    });
  }

  void submit() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      var params = {
        'nama': nama.text.toString(),
        'nik': nik.text.toString(),
        'alamat': alamat.text.toString(),
        'telp': telp.text.toString(),
        'status': _status,
        'id_kelompok_tani': idKelompok.toString(), // Konversi ke String
      };
      response = await APiService.savePetani(idPenjual, params, _imagePath);
      // Periksa jika response tidak null sebelum mengakses properti
      if (response != null) {
        _success = response!.success;
        final snackBar = SnackBar(
          content: Text(response!.message),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        if (_success) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => futurePetani(),
          ));
        }
      } else {
        final snackBar = SnackBar(
          content: Text('Failed to save petani'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    nama = TextEditingController();
    nik = TextEditingController();
    alamat = TextEditingController();
    telp = TextEditingController();
    getKelompok();
    if (widget.petani.idPenjual != null) {
      idPenjual = widget.petani.idPenjual! as int;
      nama = TextEditingController(text: widget.petani.nama);
      nik = TextEditingController(text: widget.petani.nik);
      alamat = TextEditingController(text: widget.petani.alamat);
      telp = TextEditingController(text: widget.petani.telp);
      idKelompok = widget.petani.idKelompokTani! as int;
      _status = widget.petani.status ?? 'N';
      _isupdate = true;
      _imageURL =APiService.host + '/' + widget.petani.foto!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate ? Text(widget.petani.nama!) : Text('Input Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // Widgets lainnya ...
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  futurePetani() {}
}

