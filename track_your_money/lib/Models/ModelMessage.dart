class ModelMessage {
  final bool isPrompt;
  final String message;
  final DateTime date;

  ModelMessage(
      {required this.isPrompt, required this.message, required this.date});
}
