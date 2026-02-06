class CategoriasModel {
  final String nome;

  CategoriasModel({required this.nome});
}

List<CategoriasModel> categorias = [
  CategoriasModel(nome: 'Todas'),
  CategoriasModel(nome: 'Trabalho'),
  CategoriasModel(nome: 'Saúde'),
  CategoriasModel(nome: 'Pessoal'),
  CategoriasModel(nome: 'Estudos'),
  CategoriasModel(nome: 'Outros'),
];