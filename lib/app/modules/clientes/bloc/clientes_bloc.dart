import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clientes_event.dart';
part 'clientes_state.dart';

class ClientesBloc extends Bloc<ClientesEvent, ClientesState> {
  ClientesBloc() : super(ClientesInitial());

  @override
  Stream<ClientesState> mapEventToState(
    ClientesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
