abstract class Failure {
  final String? messege;

  const Failure({this.messege});
}

class ServerFailuren extends Failure {
  const ServerFailuren({super.messege});
}
