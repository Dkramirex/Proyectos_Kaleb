import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/text_box.dart';
import 'package:preferences_app/widgets/widgets.dart';

class RegisterContacts2 extends StatefulWidget {
  static const String routerName = 'registerContacts2';
  const RegisterContacts2({Key? key}) : super(key: key);

  @override
  State<RegisterContacts2> createState() => _RegisterContacts2State();
}

class _RegisterContacts2State extends State<RegisterContacts2> {
  late TextEditingController controllerNumber;
  late TextEditingController controllerLastname;
  late TextEditingController controllerName;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerLastname = TextEditingController();
    controllerNumber = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: const Text("Agregar personal"),
        ),
        body: ListView(
          children: [
            Textbox(controllerName, 'Nombre'),
            Textbox(controllerLastname, 'Apellido'),
            Textbox(controllerNumber, 'Telefono'),
            ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String lastname = controllerLastname.text;
                String number = controllerNumber.text;

                if (name.isNotEmpty &&
                    lastname.isNotEmpty &&
                    number.isNotEmpty) {
                  Navigator.pop(
                      context,
                      Clients(
                          name: Preferences.nameClient,
                          lastname: Preferences.lastnameClient,
                          number: Preferences.numberClient));
                }
              },
              child: const Text("Guardar contacto"),
              style: ElevatedButton.styleFrom(primary: Colors.cyan.shade800),
            ),
          ],
        ));
  }
}
