import 'package:provider/provider.dart';
import 'package:sanggar_tari/models/user.dart';
import 'package:sanggar_tari/screens/login.dart';
import 'package:sanggar_tari/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:sanggar_tari/wrapper.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _alamatController = TextEditingController();
  final _noTelpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(
        String id, String name, String alamat, String noTelp, String email) {
      Provider.of<DatabaseUsers>(context, listen: false)
          .addUser(id, name, alamat, noTelp, email)
          .catchError((onError) {
        print(onError);
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error Occured"),
              content: Text("Error : $onError"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OKAY"),
                ),
              ],
            );
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo1.jpeg', width: 200),
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.indigo),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(
                        gapPadding: 2.0,
                      ),
                      hintText: 'Masukan Nama Lengkap',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _alamatController,
                    decoration: const InputDecoration(
                      labelText: 'Alamat Lengkap',
                      border: OutlineInputBorder(
                        gapPadding: 2.0,
                      ),
                      hintText: 'Masukkan Alamat Lengkap',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _noTelpController,
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telephone',
                      border: OutlineInputBorder(
                        gapPadding: 2.0,
                      ),
                      hintText: 'Masukkan Nomor Telephone',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        gapPadding: 2.0,
                      ),
                      hintText: 'Masukkan Email',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Password',
                    ),
                    obscureText: true,
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _passwordConfirmController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Kembali Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_passwordController.text !=
                          _passwordConfirmController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password Tidak Sama'),
                          ),
                        );
                      } else {
                        var signUp = await AuthServices.SignUp(
                            _emailController.text, _passwordController.text);

                        if (signUp != null) {
                          save(
                              signUp.uid,
                              _nameController.text,
                              _alamatController.text,
                              _noTelpController.text,
                              _emailController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Daftar Berhasil'),
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wrapper()),
                              (route) => false);
                        } else
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Daftar Gagal'),
                            ),
                          );
                      }
                    },
                    child: const SizedBox(
                      width: 100,
                      child: Text(
                        'Daftar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginWidget();
                          }));
                        },
                        child: const Text('Sudah Punya Akun?'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBarWidget(),
    );
  }
}
