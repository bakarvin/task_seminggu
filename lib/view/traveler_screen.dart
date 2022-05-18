import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_seminggu/viewmodel/traveler_viewmodel.dart';

class TravelerScreen extends StatefulWidget {
  const TravelerScreen({Key? key}) : super(key: key);

  @override
  _TravelerScreenState createState() => _TravelerScreenState();
}

class _TravelerScreenState extends State<TravelerScreen> {
  var pageCtrlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TravelerViewModel>(
      create: (context) => TravelerViewModel("",context),
      child: Builder(builder: (context) {
        return Consumer<TravelerViewModel>(
            builder: (context, viewModel, child) {
              pageCtrlr.text = viewModel.currentPage.toString();
          return Scaffold(
            resizeToAvoidBottomInset: false,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (_) {
                              var nameCtrlr = TextEditingController();
                              var emailCtrlr = TextEditingController();
                              var addressCtrlr = TextEditingController();
                              return AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                contentPadding: const EdgeInsets.only(),
                                content: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SizedBox(
                                    width: 500.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .stretch,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              bottom: 10.0,
                                              top: 10),
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    20.0),
                                                topRight: Radius.circular(
                                                    20.0)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              const Text(
                                                "Add Traveler",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                                textAlign: TextAlign.center,
                                              ),
                                              IconButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  icon: const Icon(
                                                    Icons.close,
                                                    size: 36,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Center(
                                              child: Column(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Text(
                                                            'Name',
                                                            style: TextStyle(
                                                                color: Colors.black, fontSize: 16),
                                                          ),
                                                          Text(
                                                            ' *',
                                                            style: TextStyle(
                                                                fontSize: 18, color: Colors.red),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1, color: Colors.black),
                                                            borderRadius: const BorderRadius.all(
                                                                Radius.circular(15)),
                                                            color: Colors.white),
                                                        child: Center(
                                                          child: TextFormField(
                                                            style: const TextStyle(fontSize: 20),
                                                            controller: nameCtrlr,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height:6,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Text(
                                                            'Email',
                                                            style: TextStyle(
                                                                color: Colors.black, fontSize: 16),
                                                          ),
                                                          Text(
                                                            ' *',
                                                            style: TextStyle(
                                                                fontSize: 18, color: Colors.red),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1, color: Colors.black),
                                                            borderRadius: const BorderRadius.all(
                                                                Radius.circular(15)),
                                                            color: Colors.white),
                                                        child: Center(
                                                          child: TextFormField(
                                                            style: const TextStyle(fontSize: 20),
                                                            controller: emailCtrlr,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Text(
                                                            'Address',
                                                            style: TextStyle(
                                                                color: Colors.black, fontSize: 16),
                                                          ),
                                                          Text(
                                                            ' *',
                                                            style: TextStyle(
                                                                fontSize: 18, color: Colors.red),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1, color: Colors.black),
                                                            borderRadius: const BorderRadius.all(
                                                                Radius.circular(15)),
                                                            color: Colors.white),
                                                        child: Center(
                                                          child: TextFormField(
                                                            style: const TextStyle(fontSize: 20),
                                                            controller: addressCtrlr,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1, color: Colors.orange),
                                                        borderRadius: const BorderRadius.all(
                                                            Radius.circular(22)),
                                                        color: Colors.white),
                                                    child: Center(
                                                        child: InkWell(
                                                          child: const Text(
                                                            "Add Traveler",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.orange,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                          onTap: () async {
                                                            await viewModel.createTraveler(
                                                                pageCtrlr.text.toString(),
                                                                nameCtrlr.text.toString(),
                                                                emailCtrlr.text.toString(),
                                                                addressCtrlr.text.toString(), context);
                                                            Navigator.pop(context);
                                                          },
                                                        )),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      icon: Icon(Icons.add)
                  )
                ],
              ),
              body: RefreshIndicator(
                displacement: 250,
                backgroundColor: Colors.yellow,
                color: Colors.red,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  viewModel.getTraveler(pageCtrlr.text, context);
                },
                child: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Page ', style: TextStyle(fontSize: 16),),
                        SizedBox(
                          width: 50,
                          height: 25,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: pageCtrlr,
                            onFieldSubmitted: (text) async {
                              viewModel.getTraveler(pageCtrlr.text, context);
                            },
                          ),
                        ),
                        const Text(' of ', style: TextStyle(fontSize: 16),),
                        Text(viewModel.totalPage.toString(), style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.listTraveler.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              await viewModel.getTravelerById(viewModel.listTraveler[index].id.toString());
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    var nameCtrlr = TextEditingController();
                                    var emailCtrlr = TextEditingController();
                                    var addressCtrlr = TextEditingController();
                                    nameCtrlr.text = viewModel.modelTraveler.name.toString();
                                    emailCtrlr.text = viewModel.modelTraveler.email.toString();
                                    addressCtrlr.text = viewModel.modelTraveler.adderes.toString();
                                   return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      contentPadding: const EdgeInsets.only(),
                                      content: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: SizedBox(
                                          width: 500.0,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .stretch,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10.0,
                                                    top: 10),
                                                decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          20.0),
                                                      topRight: Radius.circular(
                                                          20.0)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    const Text(
                                                      "Detail Traveler",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    IconButton(
                                                        onPressed: () =>
                                                            Navigator.pop(context),
                                                        icon: const Icon(
                                                          Icons.close,
                                                          size: 36,
                                                          color: Colors.white,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(16),
                                                child: Center(
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Id Traveler',
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontSize: 16),
                                                                ),
                                                                Text(
                                                                  ' *',
                                                                  style: TextStyle(
                                                                      fontSize: 18, color: Colors.red),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1, color: Colors.black),
                                                                  borderRadius: const BorderRadius.all(
                                                                      Radius.circular(15)),
                                                                  color: Colors.white),
                                                              child: Center(
                                                                child: TextFormField(
                                                                  readOnly: true,
                                                                  enabled: false,
                                                                  style: const TextStyle(fontSize: 20),
                                                                  keyboardType: TextInputType.number,
                                                                  initialValue: viewModel.modelTraveler.id.toString(),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Name',
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontSize: 16),
                                                                ),
                                                                Text(
                                                                  ' *',
                                                                  style: TextStyle(
                                                                      fontSize: 18, color: Colors.red),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1, color: Colors.black),
                                                                  borderRadius: const BorderRadius.all(
                                                                      Radius.circular(15)),
                                                                  color: Colors.white),
                                                              child: Center(
                                                                child: TextFormField(
                                                                  style: const TextStyle(fontSize: 20),
                                                                  keyboardType: TextInputType.number,
                                                                  controller: nameCtrlr,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height:6,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Email',
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontSize: 16),
                                                                ),
                                                                Text(
                                                                  ' *',
                                                                  style: TextStyle(
                                                                      fontSize: 18, color: Colors.red),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1, color: Colors.black),
                                                                  borderRadius: const BorderRadius.all(
                                                                      Radius.circular(15)),
                                                                  color: Colors.white),
                                                              child: Center(
                                                                child: TextFormField(
                                                                  style: const TextStyle(fontSize: 20),
                                                                  keyboardType: TextInputType.number,
                                                                  controller: emailCtrlr,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Address',
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontSize: 16),
                                                                ),
                                                                Text(
                                                                  ' *',
                                                                  style: TextStyle(
                                                                      fontSize: 18, color: Colors.red),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1, color: Colors.black),
                                                                  borderRadius: const BorderRadius.all(
                                                                      Radius.circular(15)),
                                                                  color: Colors.white),
                                                              child: Center(
                                                                child: TextFormField(
                                                                  style: const TextStyle(fontSize: 20),
                                                                  keyboardType: TextInputType.number,
                                                                  controller: addressCtrlr,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 6,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: const [
                                                                Text(
                                                                  'Create Date',
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontSize: 16),
                                                                ),
                                                                Text(
                                                                  ' *',
                                                                  style: TextStyle(
                                                                      fontSize: 18, color: Colors.red),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.only(left: 10),
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 1, color: Colors.black),
                                                                  borderRadius: const BorderRadius.all(
                                                                      Radius.circular(15)),
                                                                  color: Colors.white),
                                                              child: Center(
                                                                child: TextFormField(
                                                                  readOnly: true,
                                                                  enabled: false,
                                                                  style: const TextStyle(fontSize: 20),
                                                                  keyboardType: TextInputType.number,
                                                                  initialValue: viewModel.modelTraveler.createdat.toString(),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  viewModel.deleteTraveler(viewModel.currentPage.toString(), viewModel.modelTraveler.id.toString(), context);
                                                                  Navigator.pop(context);
                                                                } ,
                                                                child: Container(
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width: 1, color: Colors.red),
                                                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                                      color: Colors.red),
                                                                  child: const Center(
                                                                    child: Text(
                                                                      "Hapus",
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 12),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  await viewModel.updateTraveler(viewModel.currentPage.toString(),
                                                                      viewModel.modelTraveler.id.toString(),
                                                                                            nameCtrlr.text.toString(),
                                                                                            emailCtrlr.text.toString(),
                                                                                            addressCtrlr.text.toString(), context);
                                                                  print('Name =>' + nameCtrlr.text.toString());
                                                                  print('Email =>' + emailCtrlr.text.toString());
                                                                  print('Address =>' + addressCtrlr.text.toString());
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width: 1, color: Colors.orange),
                                                                      borderRadius:
                                                                      BorderRadius.all(Radius.circular(15)),
                                                                      color: Colors.white),
                                                                  child: const Center(
                                                                    child: Text(
                                                                      "Update",
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          color: Colors.orange,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: SizedBox(
                              height: 120,
                              child: Card(
                                elevation: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewModel.listTraveler[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Email : ",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  viewModel.listTraveler[index].email
                                                      .toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style:
                                                      const TextStyle(fontSize: 16),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Created : ",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                viewModel
                                                    .listTraveler[index].createdat
                                                    .toString(),
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                )
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 40,),
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
