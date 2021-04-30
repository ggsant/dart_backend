// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ProductsControllerRouter(ProductsController service) {
  final router = Router();
  router.add('POST', r'/addProducts', service.addProduct);
  router.add('PUT', r'/editProduct/<id>', service.editProduct);
  router.add('GET', r'/', service.getAllProducts);
  router.add('GET', r'/<id>', service.getAllProductsId);
  router.add('DELETE', r'/deleteProducts/<id>', service.deleteProduct);
  return router;
}
