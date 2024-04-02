class SelectableParameter {
  SelectableParameter({
    required this.title,
    required this.hints,
    required this.required
  });

  final String title;
  final List<String> hints;
  final bool required;
  late String value;

}
