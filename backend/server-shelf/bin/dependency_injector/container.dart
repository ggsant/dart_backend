import '../apis/crud.dart';
import '../apis/login_api.dart';
import '../infras/security/security_service.dart';
import '../infras/security/security_service_generic.dart';
import '../services/content_service.dart';
import 'dependency_injector.dart';

class Container {
  static DependencyInjector initialize() {
    final injectorDependency = DependencyInjector();

    injectorDependency.registerInstance<SecurityService>(() => SecurityServiceImpl());

    injectorDependency.registerInstance<ContentService>(() => ContentService());

    injectorDependency.registerInstance<LoginApi>(() => LoginApi(injectorDependency<SecurityService>()));

    injectorDependency.registerInstance<CrudApi>(() => CrudApi(injectorDependency<ContentService>()));

    return injectorDependency;
  }
}
