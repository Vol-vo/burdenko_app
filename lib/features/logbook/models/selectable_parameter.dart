class SelectableParameter {
  SelectableParameter({
    required this.title,
    this.hints = const [],
  });

  final String title;
  final List<String> hints;
}
