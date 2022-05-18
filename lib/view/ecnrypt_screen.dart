import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_seminggu/viewmodel/encrypt_viewmodel.dart';

class EncryptScreen extends StatefulWidget {
  const EncryptScreen({Key? key}) : super(key: key);

  @override
  _EncryptScreenState createState() => _EncryptScreenState();
}

class _EncryptScreenState extends State<EncryptScreen> {

  var asalEncryptCtrlr = TextEditingController();
  var hasilEncryptCtrlr = TextEditingController();
  var asalDecryptCtrlr = TextEditingController();
  var hasilDecryptCtrlr = TextEditingController();

  @override
  void dispose(){
    asalEncryptCtrlr.dispose();
    hasilEncryptCtrlr.dispose();
    asalDecryptCtrlr.dispose();
    hasilDecryptCtrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<EncryptViewModel>(
      create: (context) => EncryptViewModel(context),
      child: Builder(builder: (context) {
        return Consumer<EncryptViewModel>(
            builder: (context, viewModel, child) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Encrypt Screen'),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Plain Text',
                                style:
                                TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                ' *',
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            maxLines: 3,
                            controller: asalEncryptCtrlr,
                            decoration: const InputDecoration(
                              hintText: 'Plain Text',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            children: const [
                              Text(
                                'Encrypt Text',
                                style:
                                TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                ' *',
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                          TextFormField(
                            readOnly: true,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 3,
                            controller: hasilEncryptCtrlr,
                            decoration: const InputDecoration(
                              hintText: 'Encrypt Text',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Container(
                            padding: const EdgeInsets.all(10),
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
                                  onTap: () async {
                                    // decryptAES(asalCtrlr.text.toString());
                                    await viewModel.encryptAES(asalEncryptCtrlr.text.toString());
                                    hasilEncryptCtrlr.text = viewModel.hasilEncrypted.toString();
                                  },
                                )),
                          ),
                          const SizedBox(height: 16,),

                          Row(
                            children: const [
                              Text(
                                'Decrypt Text',
                                style:
                                TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                ' *',
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            maxLines: 3,
                            controller: asalDecryptCtrlr,
                            decoration: const InputDecoration(
                              hintText: 'Encrypt Text',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            children: const [
                              Text(
                                'Decrypt Text',
                                style:
                                TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Text(
                                ' *',
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              )
                            ],
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            maxLines: 3,
                            controller: hasilDecryptCtrlr,
                            decoration: const InputDecoration(
                              hintText: 'Encrypt Text',
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: Colors.orange),
                            child: Center(
                                child: InkWell(
                                  child: const Text(
                                    "Decrypt",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () async {
                                    await viewModel.decryptAES(asalDecryptCtrlr.text.toString());
                                    hasilDecryptCtrlr.text = viewModel.hasilDecrypted.toString();
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              );
            });
      }),
    );
  }
}
