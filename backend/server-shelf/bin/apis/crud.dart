import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/content_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class CrudApi extends Api {
  final GenericService<ContentModel> _service;

  CrudApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    final router = Router();

    router.get('/crud/content', (Request request) {
      Set<ContentModel> content = _service.findAll();
      final contentMap = content.map((e) => e.toJson()).toList();
      return Response.ok(
        contentMap.toString(),
      );
    });

    router.post('/crud/content', (Request request) async {
      final body = await request.readAsString();
      _service.save(ContentModel.fromJson(body));
      return Response(201);
    });

    /// url: /crud/content?id=1
    router.put('/crud/content', (Request request) async {
      String? id = request.url.queryParameters['id'];
      // _service.save(ContentModel(id, content, criationDate, updateDate));
      // return Response(201);
    });

    /// url: /crud/content?id=1
    router.delete('/crud/content', (Request request) {
      String? id = request.url.queryParameters['id'];
      // _service.delete(1);

      return Response.ok('Delete Content');
    });

    return createHandler(router: router, middlewares: middlewares);
  }
}
