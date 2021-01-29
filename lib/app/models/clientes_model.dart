// To parse this JSON data, do
//
//     final clienteModel = clienteModelFromJson(jsonString);

import 'dart:convert';

ClienteModel clienteModelFromJson(String str) =>
    ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {
  ClienteModel({
    this.id,
    this.vendedor,
    this.nome,
    this.fantasia,
    this.cpf,
    this.rg,
    this.cnpj,
    this.email,
    this.telefone,
    this.cep,
    this.endereco,
    this.numero,
    this.cidade,
    this.estado,
    this.visita,
    this.plano,
  });

  String id;
  String vendedor;
  String nome;
  String fantasia;
  String cpf;
  String rg;
  String cnpj;
  String email;
  String telefone;
  String cep;
  String endereco;
  String numero;
  String cidade;
  String estado;
  String visita;
  String plano;

  ClienteModel copyWith({
    String id,
    String vendedor,
    String nome,
    String fantasia,
    String cpf,
    String rg,
    String cnpj,
    String email,
    String telefone,
    String cep,
    String endereco,
    String numero,
    String cidade,
    String estado,
    String visita,
    String plano,
  }) =>
      ClienteModel(
        id: id ?? this.id,
        vendedor: vendedor ?? this.vendedor,
        nome: nome ?? this.nome,
        fantasia: fantasia ?? this.fantasia,
        cpf: cpf ?? this.cpf,
        rg: rg ?? this.rg,
        cnpj: cnpj ?? this.cnpj,
        email: email ?? this.email,
        telefone: telefone ?? this.telefone,
        cep: cep ?? this.cep,
        endereco: endereco ?? this.endereco,
        numero: numero ?? this.numero,
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        visita: visita ?? this.visita,
        plano: plano ?? this.plano,
      );

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        id: json["id"] == null ? null : json["id"],
        vendedor: json["vendedor"] == null ? null : json["vendedor"],
        nome: json["nome"] == null ? null : json["nome"],
        fantasia: json["fantasia"] == null ? null : json["fantasia"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        rg: json["rg"] == null ? null : json["rg"],
        cnpj: json["cnpj"] == null ? null : json["cnpj"],
        email: json["email"] == null ? null : json["email"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        cep: json["cep"] == null ? null : json["cep"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        numero: json["numero"] == null ? null : json["numero"],
        cidade: json["cidade"] == null ? null : json["cidade"],
        estado: json["estado"] == null ? null : json["estado"],
        visita: json["visita"] == null ? null : json["visita"],
        plano: json["plano"] == null ? null : json["plano"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "vendedor": vendedor == null ? null : vendedor,
        "nome": nome == null ? null : nome,
        "fantasia": fantasia == null ? null : fantasia,
        "cpf": cpf == null ? null : cpf,
        "rg": rg == null ? null : rg,
        "cnpj": cnpj == null ? null : cnpj,
        "email": email == null ? null : email,
        "telefone": telefone == null ? null : telefone,
        "cep": cep == null ? null : cep,
        "endereco": endereco == null ? null : endereco,
        "numero": numero == null ? null : numero,
        "cidade": cidade == null ? null : cidade,
        "estado": estado == null ? null : estado,
        "visita": visita == null ? null : visita,
        "plano": plano == null ? null : plano,
      };
}
