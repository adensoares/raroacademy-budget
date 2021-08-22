class AppController {
  String userId = "";
  String name = "";
  String email = "";
  String phoneNumber = "";
  String cpf = "";

  AppController(
    Object object, {
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.cpf,
  });
}
