import 'package:flutter/material.dart';
import 'package:sinaliza_vendas/app/modules/clientes/add/add_page.dart';
import 'package:sinaliza_vendas/app/modules/clientes/list_clientes.dart';

class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clientes'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                bool result = await Navigator.push(context,
                    MaterialPageRoute(builder: (_) {
                  return AddClientes();
                }));
                if (result) {
                  setState(() {});
                } else {}
              })
        ],
      ),
      body: ListClientes(),
    );
  }
}
