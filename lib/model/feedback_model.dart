class FeedbackModel {
  final String email;
  final String name;
  final String subject;
  final String message;

  FeedbackModel({
    required this.email,
    required this.name,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'subject': subject,
      'message': message,
    };
  }
}
