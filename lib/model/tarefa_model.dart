class TarefaModel {
  final String title;
  final String categoria;
  final String prioridade;
  final String? hora;
  final DateTime data;
  final String? notas;
  final bool selected;
  final bool isCompleted;

  const TarefaModel({
    required this.title,
    required this.categoria,
    required this.prioridade,
    this.hora,
    required this.data,
    this.notas,
    this.selected = false,
    this.isCompleted = false,
  });

  static List<TarefaModel> tarefasMockadas = [
    TarefaModel(
      title: 'Reunião com equipe',
      categoria: 'Trabalho',
      prioridade: 'Alta',
      data: DateTime(2026, 2, 4),
      hora: '10:00',
      notas: 'Discutir o progresso do projeto e próximos passos.',
      isCompleted: true,
    ),
    TarefaModel(
      title: 'Academia',
      categoria: 'Saúde',
      prioridade: 'Média',
      data: DateTime(2026, 2, 4),
      hora: '06:00',
      notas: 'Treino de pernas e abdômen.',
      isCompleted: false,
    ),
    TarefaModel(
      title: 'Estudar Flutter',
      categoria: 'Estudos',
      prioridade: 'Alta',
      data: DateTime(2026, 2, 4),
      hora: '19:00',
      notas: 'Praticar exercícios e revisar conceitos importantes.',
      isCompleted: false,
    ),

    TarefaModel(
      title: 'Consulta médica',
      categoria: 'Saúde',
      prioridade: 'Média',
      data: DateTime(2026, 2, 2),
      hora: '14:00',
      notas: 'Consulta de rotina com o médico. Levar exames recentes.',
      isCompleted: true,
    ),
    TarefaModel(
      title: 'Comprar mantimentos',
      categoria: 'Pessoal',
      prioridade: 'Baixa',
      data: DateTime(2026, 2, 2),
      hora: '17:00',
      notas: 'Comprar frutas, vegetais e produtos de limpeza.',
      isCompleted: false,
    ),

    TarefaModel(
      title: 'Entregar relatório',
      categoria: 'Trabalho',
      prioridade: 'Alta',
      data: DateTime(2026, 2, 5),
      hora: '09:00',
      notas: 'Relatório mensal de vendas.',
      isCompleted: false,
    ),
    TarefaModel(
      title: 'Dentista',
      categoria: 'Saúde',
      prioridade: 'Média',
      data: DateTime(2026, 2, 5),
      hora: '15:30',
      notas: 'Limpeza semestral.',
      isCompleted: false,
    ),

    TarefaModel(
      title: 'Aniversário do João',
      categoria: 'Pessoal',
      prioridade: 'Alta',
      data: DateTime(2026, 2, 10),
      hora: '20:00',
      notas: 'Comprar presente e ir à festa.',
      isCompleted: true,
    ),

    TarefaModel(
      title: 'Prova de certificação',
      categoria: 'Estudos',
      prioridade: 'Alta',
      data: DateTime(2026, 2, 15),
      hora: '08:00',
      notas: 'Certificação em Flutter.',
      isCompleted: false,
    ),
    TarefaModel(
      title: 'Almoço com cliente',
      categoria: 'Trabalho',
      prioridade: 'Média',
      data: DateTime(2026, 2, 15),
      hora: '12:00',
      notas: 'Restaurante no centro.',
      isCompleted: true,
    ),
  ];

  static List<TarefaModel> getTarefasPorData(DateTime data) {
    return tarefasMockadas.where((tarefa) {
      return tarefa.data.year == data.year &&
          tarefa.data.month == data.month &&
          tarefa.data.day == data.day;
    }).toList();
  }
}
