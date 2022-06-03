import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/text_box.dart';
import 'package:preferences_app/widgets/widgets.dart';

class RegisterContacts extends StatefulWidget {
  static const String routerName = 'registerContacts';
  const RegisterContacts({Key? key}) : super(key: key);

  @override
  State<RegisterContacts> createState() => _RegisterContactsState();
}

class _RegisterContactsState extends State<RegisterContacts> {
  /* late TextEditingController controllerNumber;
  late TextEditingController controllerLastname;
  late TextEditingController controllerName;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerLastname = TextEditingController();
    controllerNumber = TextEditingController();
    super.initState();
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Contacts')),
        drawer: const SideMenu(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
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
                    child: (const Text('Guardar contacto')),
                  )
                ]))));
  }
}
        /*children: [
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
                  Navigator.pop(context, Clients());
                }
              },
              child: const Text("Editar contacto")),
        ],
      ),
    );
  }*/
 

