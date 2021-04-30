// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$FilesControllerRouter(FilesController service) {
  final router = Router();
  router.add('POST', r'/uploadFiles', service.upload);
  router.add('GET', r'/<name>', service.getFile);
  return router;
}
