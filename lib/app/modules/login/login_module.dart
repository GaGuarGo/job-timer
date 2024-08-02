import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}
