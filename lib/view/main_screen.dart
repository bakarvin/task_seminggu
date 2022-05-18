import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:task_seminggu/service/api/traveller_api_service.dart';
import 'package:task_seminggu/view/traveler_screen.dart';

import 'ecnrypt_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _travelerApi = TravellerApiService();

  decryptAES(){
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

    final key = encrypt.Key.fromSecureRandom(32);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print('Teks awal => ' + plainText);

    print('Teks encrypt via bytes => ' + encrypted.bytes.toString());
    print('Teks encrypt via base16 => ' + encrypted.base16);
    print('Teks encrypt via base64 => ' + encrypted.base64);

    print('Teks decrypted => ' + decrypted);
  }

  @override
  void initState() {
    // TODO: implement initState
    decryptAES();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 80, left: 80),
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.orange),
              child: Center(
                  child: InkWell(
                    child: const Text(
                      "Encrypt",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // decryptAES();
                      Navigator.push(context, MaterialPageRoute(builder: (_) => EncryptScreen()));
                    },
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 80, left: 80),
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.orange),
              child: Center(
                  child: InkWell(
                    child: const Text(
                      "Api Traveler",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const TravelerScreen()));
                    },
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )
      ),
    );
  }
}
