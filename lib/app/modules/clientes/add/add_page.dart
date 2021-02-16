import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaliza_vendas/app/models/clientes_model.dart';
import 'package:sinaliza_vendas/app/modules/clientes/add/add_bloc.dart';
import 'package:sinaliza_vendas/app/modules/clientes/bloc/clientes_bloc.dart';
import 'package:sinaliza_vendas/app/repositories/clientes_repository.dart';

class AddClientes extends StatefulWidget {
  final cliente;
  const AddClientes({Key key, this.cliente}) : super(key: key);
  @override
  _AddClientesState createState() => _AddClientesState();
}

class _AddClientesState extends State<AddClientes> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final repository = RepositoryProvider.of<ClientesRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cliente == null
            ? 'Adicione seus clientes'
            : 'Edite seus clientes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ClientesBloc, ClientesState>(
          builder: (context, state) {
            return Column(
              children: [
                changeDocumento(),
                fields(controller: repository.nomeController, text: 'Nome'),
                (repository.tipoDocumento)
                    ? fields(
                        controller: repository.cpfController,
                        text: 'CPF',
                        formato: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ])
                    : fields(
                        controller: repository.cnpjController,
                        text: 'CNPJ',
                        formato: [
                            FilteringTextInputFormatter.digitsOnly,
                            CnpjInputFormatter()
                          ]),
                (repository.tipoDocumento)
                    ? fields(
                        controller: repository.rgController,
                        text: 'RG',
                        formato: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ])
                    : Container(),
                fields(controller: repository.emailController, text: 'Email'),
                fields(
                    controller: repository.telefoneController,
                    text: 'Telefone',
                    formato: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ]),
                enderecoForms(),
                button()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget changeDocumento() {
    final repository = RepositoryProvider.of<ClientesRepository>(context);
    Color colorOn = Colors.purple;
    Color colorOff = Colors.grey;
    return Row(
      children: [
        Text('Pessoa: '),
        RaisedButton(
            color: (repository.tipoDocumento) ? colorOn : colorOff,
            child: Text('física'),
            onPressed: () {
              setState(() {
                repository.tipoDocumento = true;
              });
            }),
        RaisedButton(
            color: (repository.tipoDocumento) ? colorOff : colorOn,
            child: Text('Jurídica'),
            onPressed: () {
              setState(() {
                repository.tipoDocumento = false;
              });
            }),
        planos()
      ],
    );
  }

  Widget fields(
      {TextEditingController controller, String text, var formato, onChange}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        inputFormatters: formato,
        decoration: InputDecoration(
          hintText: text,
          labelText: text,
        ),
      ),
    );
  }

  Widget enderecoForms() {
    //ignore: close_sinks
    final bloc = BlocProvider.of<AddBloc>(context);
    final repository = RepositoryProvider.of<ClientesRepository>(context);
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        if (state is SetEndereco) {
          repository.enderecoController.text = state.endereco.endereco;
          repository.cidadeController.text = state.endereco.cidade;
          repository.estadoController.text = state.endereco.estado;
        }
        return Column(
          children: [
            fields(
                controller: repository.cepController,
                text: 'CEP',
                formato: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter()
                ],
                onChange: (String value) async {
                  if (value.length > 9) {
                    print(value);
                    bloc.add(GetEndereco(cep: value));
                  }
                }),
            fields(controller: repository.enderecoController, text: 'Endereco'),
            fields(controller: repository.numeroController, text: 'Numero'),
            fields(controller: repository.cidadeController, text: 'Cidade'),
            fields(controller: repository.estadoController, text: 'Estado'),
          ],
        );
      },
    );
  }

  Widget button() {
    //ignore: close_sinks
    final bloc = BlocProvider.of<AddBloc>(context);
    final repository = RepositoryProvider.of<ClientesRepository>(context);
    return BlocBuilder<AddBloc, AddState>(builder: (context, state) {
      if (state is LoadingState) {
        return Container(
          child: CircularProgressIndicator(),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              ClienteModel clienteModel = ClienteModel();
              repository.cliente == null
                  ? bloc.add(AdicionarCliente(cliente: clienteModel))
                  : bloc.add(EditarCliente(cliente: clienteModel));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(repository.cliente == null ? 'Cadastrar' : 'Editar'),
            ),
          ),
        );
      }
    });
  }

  Widget planos() {
    var width = MediaQuery.of(context).size.width;
    final repository = RepositoryProvider.of<ClientesRepository>(context);
    return Container(
        height: 40,
        width: width * 0.4,
        child: DropdownButton<String>(
          onChanged: (String selecionado) {
            setState(() {
              repository.planoSelecionado = selecionado;
            });
          },
          underline: Container(),
          isExpanded: true,
          value: repository.planoSelecionado,
          items: repository.listPlanos.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Center(
                child: Text('$dropDownStringItem',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    textAlign: TextAlign.center),
              ),
            );
          }).toList(),
        ));
  }
}
