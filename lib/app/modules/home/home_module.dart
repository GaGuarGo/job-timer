import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
