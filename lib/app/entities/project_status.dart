// ignore_for_file: constant_identifier_names

enum ProjectStatus {
  em_andamento(label: 'Em andamento'),
  finalizado(label: 'Finalizado');

  final String label;

  const ProjectStatus({required this.label});
}
