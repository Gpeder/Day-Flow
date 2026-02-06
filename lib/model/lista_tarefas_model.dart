class ListaTarefasModel {
  final String title;
  final String categoria;
  final String prioridade;
  final String data;
  final String hora;
  final String notas;
  bool selected;

  ListaTarefasModel({
    required this.title,
    required this.categoria,
    required this.prioridade,
    required this.data,
    required this.hora,
    required this.notas,
    required this.selected,
  });
}

List<ListaTarefasModel> tarefas = [
  ListaTarefasModel(
    title: 'Reunião com equipe',
    categoria: 'Trabalho',
    prioridade: 'Alta',
    data: '2024-06-10',
    hora: '10:00',
    notas: 'Discutir o progresso do projeto e próximos passos.',
    selected: false,
  ),
  ListaTarefasModel(
    title: 'Consulta médica',
    prioridade: 'Média',
    categoria: 'Saúde',
    data: '2024-06-10',
    hora: '5:00',
    notas: 'Consulta de rotina com o médico. Levar exames recentes.',
    selected: false,
  ),
  ListaTarefasModel(
    title: 'Comprar mantimentos',
    prioridade: 'Baixa',
    categoria: 'Pessoal',
    data: '2024-06-10',
    hora: '7:00',
    notas: 'Comprar frutas, vegetais e produtos de limpeza.',
    selected: false,
  ),
  ListaTarefasModel(
    title: 'Estudar Flutter',
    prioridade: 'Alta',
    categoria: 'Estudos',
    data: '2024-06-10',
    hora: '10:00',
    notas: 'Praticar exercícios e revisar conceitos importantes.',
    selected: false,
  ),
  ListaTarefasModel(
    title: 'Reunião com equipe',
    categoria: 'Trabalho',
    prioridade: 'Alta',
    data: '2024-06-10',
    hora: '10:00',
    notas: 'Discutir o progresso do projeto e próximos passos.',
    selected: false,
  ),
  ListaTarefasModel(
    title: 'Consulta médica',
    prioridade: 'Média',
    categoria: 'Saúde',
    data: '2024-06-10',
    hora: '2:00',
    notas: 'Consulta de rotina com o médico. Levar exames recentes.',
    selected: false,
  ),
];
