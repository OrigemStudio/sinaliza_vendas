import 'package:cep_future/cep_future.dart';
import 'package:sinaliza_vendas/app/models/endereco_model.dart';

class EnderecoRepository {
  Future<EnderecoModel> getEndereco(String cep) async {
    cep.replaceAll(new RegExp(r'[^0-9]'), '');
    var result = await cepFuture(cep);
    if (result != null) {
      return EnderecoModel(cep, result.street, '', result.city, result.state);
    } else {
      return null;
    }
  }
}
