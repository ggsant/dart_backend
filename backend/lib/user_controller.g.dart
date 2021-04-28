// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$UserControllerRouter(UserController service) {
  final router = Router();
  router.add('GET', r'/', service.getAll);
  router.add('GET', r'/<userId>', service.getUser);
  return router;
}
