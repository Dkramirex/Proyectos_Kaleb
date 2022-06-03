import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class Modifycontact2 extends StatefulWidget {
  //final Clients _client;
  static const String routerName = 'ModifyClients';

  const Modifycontact2({Key? key}) : super(key: key);
  @override
  State<Modifycontact2> createState() => _Modifycontact2State();
}

class _Modifycontact2State extends State<Modifycontact2> {
  late TextEditingController controllerNumber;
  late TextEditingController controllerLastname;
  late TextEditingController controllerName;

  @override
  void initState() {
    controllerName = TextEditingController(text: Preferences.nameClient);
    controllerLastname =
        TextEditingController(text: Preferences.lastnameClient);
    controllerNumber = TextEditingController(text: Preferences.numberClient);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Contacts')),
        drawer: const SideMenu(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: Preferences.nameClient,
                      onChanged: (name) {
                        Preferences.nameClient = name;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          labelText: 'Nombre',
                          helperText: 'Nombre del usuario'),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: Preferences.lastnameClient,
                      onChanged: (lastname) {
                        Preferences.lastnameClient = lastname;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          labelText: 'Apellidos',
                          helperText: 'Apellidos del usuario'),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      initialValue: Preferences.numberClient,
                      onChanged: (number) {
                        Preferences.numberClient = number;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          labelText: 'Numero',
                          helperText: 'Numero del usuario'),
                    ),
                  ),
                  const Divider(),
                  ElevatedButton(
                    onPressed: () {
                      String name = Preferences.nameClient;
                      String lastname = Preferences.lastnameClient;
                      String number = Preferences.numberClient;

                      if (name.isNotEmpty &&
                          lastname.isNotEmpty &&
                          number.isNotEmpty) {
                        Navigator.pop(
                            context,
                            Clients(
                                lastname: Preferences.lastnameClient,
                                name: Preferences.nameClient,
                                number: Preferences.numberClient));
                      }
                    },
                    child: const Text('Guardar contacto'),
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        fixedSize: const Size(490, 40),
                        primary: Colors.cyan.shade800),
                  ),
                ]))));
  }
}
