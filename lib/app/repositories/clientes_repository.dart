import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:sinaliza_vendas/app/models/clientes_model.dart';

enum TipoSet { add, editar }

class ClientesRepository {
  HasuraConnect _hasuraConnect =
      HasuraConnect('https://sinaliza-vendas.hasura.app/v1/graphql');
  ClienteModel cliente = ClienteModel();
  var nomeController = TextEditingController();
  var fantasiaController = TextEditingController();
  var cpfController = TextEditingController();
  var rgController = TextEditingController();
  var cnpjController = TextEditingController();
  var emailController = TextEditingController();
  var telefoneController = TextEditingController();
  var enderecoController = TextEditingController();
  var numeroController = TextEditingController();
  var cepController = TextEditingController();
  var cidadeController = TextEditingController();
  var estadoController = TextEditingController();
  var visitaController = TextEditingController();
  bool tipoDocumento = false;
  String planoSelecionado = 'basic';
  List<String> listPlanos = ['basic', 'middle', 'ultra', 'unlimited'];
  List<ClienteModel> listClientes;

  void init(ClienteModel cliente) {
    nomeController =
        TextEditingController(text: cliente != null ? cliente.nome : null);
    fantasiaController =
        TextEditingController(text: cliente != null ? cliente.fantasia : null);
    cpfController =
        TextEditingController(text: cliente != null ? cliente.cpf : null);
    emailController =
        TextEditingController(text: cliente != null ? cliente.email : null);
    telefoneController =
        TextEditingController(text: cliente != null ? cliente.telefone : null);
    enderecoController =
        TextEditingController(text: cliente != null ? cliente.endereco : null);
    numeroController =
        TextEditingController(text: cliente != null ? cliente.numero : null);
    cepController =
        TextEditingController(text: cliente != null ? cliente.cep : null);
    cidadeController =
        TextEditingController(text: cliente != null ? cliente.cidade : null);
    estadoController =
        TextEditingController(text: cliente != null ? cliente.estado : null);
    visitaController =
        TextEditingController(text: cliente != null ? cliente.visita : null);
    cnpjController =
        TextEditingController(text: cliente != null ? cliente.cnpj : null);
    rgController =
        TextEditingController(text: cliente != null ? cliente.rg : null);
  }

  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    rgController.dispose();
    cnpjController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    enderecoController.dispose();
    numeroController.dispose();
    cepController.dispose();
    cidadeController.dispose();
    estadoController.dispose();
    visitaController.dispose();
  }

  Future<String> testeFields(ClienteModel cliente) async {
    if (cliente.email == null || !cliente.email.contains('@')) {
      return 'Email inválido';
    } else if (cliente.nome == null) {
      return 'Senha inválida';
    } else if (cliente.telefone == null) {
      return 'Email e senha inválidos';
    } else {
      return 'ok';
    }
  }

  Future<dynamic> setCliente(ClienteModel cliente, TipoSet tipoSet) async {
    var query;
    if (tipoSet == TipoSet.add) {
      query = r"""
      mutation setCliente($id:String!,$vendedorId:String!,$nome:String!,$email:String!,$telefone:String!,$fantasia:String!,$cpf:String!,$cnpj:String!,$rg:String!,$visita:String!,$cep:String!,$endereco:String!,$numero:String!,$cidade:String!,$estado:String!, $plano:String!) {
        insert_clientes(objects: {id: $id, vendedor_id: $vendedorId, nome: $nome, email: $email, telefone: $telefone, fantasia: $fantasia, cpf: $cpf, cnpj: $cnpj, rg: $rg, ultima_visita: $visita, cep: $cep, endereco: $endereco, numero: $numero, cidade: $cidade, estado: $estado, plano:$plano}) {
          affected_rows
        }
      }
    """;
    } else {
      query = r"""
      mutation setCliente($id:String!,$vendedorId:String!,$nome:String!,$email:String!,$telefone:String!,$fantasia:String!,$cpf:String!,$cnpj:String!,$rg:String!,$visita:String!,$cep:String!,$endereco:String!,$numero:String!,$cidade:String!,$estado:String!, $plano:String!) {
        update_clientes(objects: {id: $id, vendedor_id: $vendedorId, nome: $nome, email: $email, telefone: $telefone, fantasia: $fantasia, cpf: $cpf, cnpj: $cnpj, rg: $rg, ultima_visita: $visita, cep: $cep, endereco: $endereco, numero: $numero, cidade: $cidade, estado: $estado, plano:$plano}) {
          affected_rows
        }
      }
    """;
    }
    var doc = await _hasuraConnect.mutation(query, variables: {
      "id": cliente.id,
      "vendedorId": cliente.vendedor,
      "nome": cliente.nome,
      "email": cliente.email,
      "telefone": cliente.telefone,
      "fantasia": cliente.fantasia,
      "cpf": cliente.cpf,
      "cnpj": cliente.cnpj,
      "rg": cliente.rg,
      "visita": cliente.visita,
      "cep": cliente.cep,
      "endereco": cliente.endereco,
      "numero": cliente.numero,
      "cidade": cliente.cidade,
      "estado": cliente.estado,
      "plano": cliente.plano
    });
    return doc;
  }
}
