import 'package:flutter_module_architecture/flutter_module_architecture.dart';

class AppDependencyContainer extends DependencyContainer {
  @override
  Future<void> init() async {
    print("init");
  }

  @override
  Future<void> dispose() async {
    print("dispose");
  }
}
