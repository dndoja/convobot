import 'package:grpc/grpc.dart' as grpc;

import 'services/services.dart';
import 'routes/routes.dart';

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server([ConversationService()]);
    await server.serve(port: 65234);
    initializeServices();
    print('Server listening on port ${server.port}...');
  }
}
