import 'package:sinaliza_vendas/app/models/sub_page_model.dart';
import 'package:sinaliza_vendas/app/modules/clientes/clientes_page.dart';
import 'package:sinaliza_vendas/app/modules/home/home_page.dart';
import 'package:sinaliza_vendas/app/modules/perfil/perfil_page.dart';

class SubSideBar {
  List listSubPage;

  List listSubPageWidgets;

  List<SubPageModel> listTeste = [SubPageModel(title: 'a', page: HomePage())];

  List listHomePage = [
    'Meu Perfil',
    'Meus Clientes',
    'Clientes Alvo',
    'Minhas Vendas',
    'Pós Venda',
    'Datas e Renovações',
  ];

  List listHomePageWidgets = [
    PerfilPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
  ];

  List listReprePage = [
    'Meu Perfil',
    'Meus Clientes',
    'Clientes Alvo',
    'Minhas Vendas',
    'Pós Venda',
    'Datas e Renovações',
  ];

  List listReprePageWidgets = [
    PerfilPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
  ];

  List listContratosPage = [
    'Meu Perfil',
    'Meus Clientes',
    'Clientes Alvo',
    'Minhas Vendas',
    'Pós Venda',
    'Datas e Renovações',
  ];

  List listContratosPageWidgets = [
    PerfilPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
  ];

  List listExpansoesPage = [
    'Meu Perfil',
    'Meus Clientes',
    'Clientes Alvo',
    'Minhas Vendas',
    'Pós Venda',
    'Datas e Renovações',
  ];

  List listExpansoesPageWidgets = [
    PerfilPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
  ];

  List listDestaquesPage = [
    'Meu Perfil',
    'Meus Clientes',
    'Clientes Alvo',
    'Minhas Vendas',
    'Pós Venda',
    'Datas e Renovações',
  ];

  List listDestaquesPageWidgets = [
    PerfilPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
    ClientesPage(),
  ];
}
