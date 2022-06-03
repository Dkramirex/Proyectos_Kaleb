import 'package:flutter/material.dart';
import 'package:preferences_app/providers/ModifyClient_screen2.dart';
import 'package:preferences_app/providers/register_contacts2.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:preferences_app/providers/register_contacts.dart';

class ContactScreen2 extends StatefulWidget {
  const ContactScreen2({Key? key}) : super(key: key);
  static const String routerName = 'Contacts2';

  @override
  State<ContactScreen2> createState() => _ContactScreen2State();
}

class _ContactScreen2State extends State<ContactScreen2> {
  List<Clients> Client = [
    Clients(
        name: Preferences.nameClient,
        lastname: Preferences.lastnameClient,
        number: Preferences.numberClient),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      drawer: const SideMenu(),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: Client.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Modifycontact2()))
                .then((newcontact) {
              if (newcontact != null) {
                (setState(() {
                  Client.removeAt(index);
                  Client.insert(index, newcontact);
                }));
              }
            });
          },
          onLongPress: () {
            removeClient(context, Client[index]);
          },
          title: Text(
              ' ${Preferences.nameClient}' + ' ${Preferences.lastnameClient}'),
          subtitle: Text(' ${Preferences.numberClient} '),
          leading: CircleAvatar(
            child: Text(
              '' + Preferences.nameClient.substring(0, 1),
              style: const TextStyle(color: Colors.black87),
            ),
            backgroundColor: const Color(0xff89898f),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black87,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RegisterContacts2()))
                .then((newcontact) {
              if (newcontact != null) {
                setState(() {
                  Client.add(newcontact);
                });
              }
            });
          },
          child: const Icon(Icons.ac_unit)),
    );
  }

  removeClient(BuildContext context, Clients client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar cliente"),
              content: Text(
                  "Esta seguro de eliminar a " + Preferences.nameClient + "? "),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      Client.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ));
  }
}

class Clients {
  var name = Preferences.name;
  var lastname = Preferences.lastnameClient;
  var number = Preferences.numberClient;

  Clients({required this.name, required this.lastname, required this.number});
}
