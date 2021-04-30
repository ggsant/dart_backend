import 'dart:async';
import 'dart:convert';

import 'package:crud/models/product/product_model.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'products_controller.g.dart';

class ProductsController {
  @Route.post('/addProducts')
  FutureOr<Response> addProduct(Request request) async {
    try {
      final body = jsonDecode(await request.readAsString());
      final product = Product.fromJson(body);
      return Response.ok(
        jsonEncode(product.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      final error = {
        'msg': 'Erro ao adicionar produtos!',
        'error': e.toString(),
      };
      return Response.internalServerError(body: jsonEncode(error), headers: {
        'Content-Type': 'application/json',
      });
    }
  }

  @Route.put('/editProduct/<id>')
  FutureOr<Response> editProduct(Request request, String id) async {
    try {
      return Response.ok(
        jsonEncode({'msg': 'Produto com o id $id foi atualizado'}),
        headers: {'Content-Type': 'application/json'},
      );
      // final body = jsonDecode(await request.readAsString());
      // final editProduct = Product.fromJson(body);
      // return Response.ok(
      //   jsonEncode(editProduct.toJson()),
      //   headers: {'Content-Type': 'application/json'},
      // );
    } catch (e) {
      final error = {
        'msg': 'Erro ao editar um produto!',
        'error': e.toString(),
      };
      return Response.internalServerError(body: jsonEncode(error), headers: {
        'Content-Type': 'application/json',
      });
    }
  }

  @Route.get('/')
  FutureOr<Response> getAllProducts(Request request) {
    try {
      return Response.ok('produtos');
    } catch (e) {
      final error = {
        'msg': 'Erro ao buscar produtos.',
        'error': e.toString(),
      };
      return Response.internalServerError(body: jsonEncode(error), headers: {
        'Content-Type': 'application/json',
      });
    }
  }

  @Route.get('/<id>')
  FutureOr<Response> getAllProductsId(Request request, String id) {
    try {
      return Response.ok('produtos $id');
    } catch (e) {
      final error = {
        'msg': 'Erro ao buscar produtos.',
        'error': e.toString(),
      };
      return Response.internalServerError(body: jsonEncode(error), headers: {
        'Content-Type': 'application/json',
      });
    }
  }

  @Route.delete('/deleteProducts/<id>')
  FutureOr<Response> deleteProduct(Request request, String id) {
    try {
      return Response.ok(
        jsonEncode({'msg': 'Deletou o produto de id: $id'}),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      final error = {
        'msg': 'Erro ao deletar um produto.',
        'error': e.toString(),
      };
      return Response.internalServerError(body: jsonEncode(error), headers: {
        'Content-Type': 'application/json',
      });
    }
  }

  Router get router => _$ProductsControllerRouter(this);
}
