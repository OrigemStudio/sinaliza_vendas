import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sinaliza_vendas/app/models/clientes_model.dart';
import 'package:sinaliza_vendas/app/models/endereco_model.dart';
import 'package:sinaliza_vendas/app/repositories/clientes_repository.dart';
import 'package:sinaliza_vendas/app/repositories/endereco_repository.dart';
import 'package:sinaliza_vendas/app/repositories/register_repository.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(InitialState());
  final ClientesRepository repository = ClientesRepository();
  final EnderecoRepository erepository = EnderecoRepository();
  final RegisterReposotory rrepository = RegisterReposotory();
  @override
  Stream<AddState> mapEventToState(
    AddEvent event,
  ) async* {
    if (event is AdicionarCliente) {
      yield LoadingState();
      String error = await repository.testeFields(event.cliente);
      if (error == 'ok') {
        var uid = await rrepository.register(event.cliente.email, 'sinaliza');
        event.cliente.id = uid;
        print(event.cliente);
        await repository.setCliente(event.cliente, TipoSet.add);
        Get.back();
      }
    } else if (event is EditarCliente) {
      yield LoadingState();
      String error = await repository.testeFields(event.cliente);
      if (error == 'ok') {
        await repository.setCliente(event.cliente, TipoSet.editar);
        Get.back();
      }
    } else if (event is GetEndereco) {
      EnderecoModel endereco = await erepository.getEndereco(event.cep);
      yield SetEndereco(endereco: endereco);
    }
  }
}
