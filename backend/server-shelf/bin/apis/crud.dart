import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/content_model.dart';
import '../services/generic_service.dart';
import 'base_api.dart';

class CrudApi extends BaseApi {
  final BaseService<ContentModel> _service;

  CrudApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = true}) {
    final router = Router();

    router.get('/crud/content', (Request request) {
      try {
        Set<ContentModel> content = _service.findAll();
        final contentMap = content.map((content) => content.toJson()).toList();

        final headers = request.headers;
        final context = request.context;
        final encoding = request.encoding;

        return Response.ok(
          contentMap.toString(),
          headers: headers,
          context: context,
          encoding: encoding,
        );
      } catch (error) {
        return Response.notFound("No content found for this url: ${request.url}");
      }
    });

    router.post('/crud/content', (Request request) async {
      try {
        final body = await request.readAsString();

        _service.save(ContentModel.fromJson(body));

        return Response(201);
      } catch (error) {
        return Response.badRequest();
      }
    });

    /// url: /crud/content?id=1
    router.put('/crud/content', (Request request) async {
      try {
        final body = await request.readAsString();
        int id = int.parse(request.url.queryParameters['id'] ?? '');
        _service.edit(ContentModel.fromJson(body), id);
        return Response(201);
      } catch (error) {
        return Response.badRequest(body: 'Content not edited.');
      }
    });

    /// url: /crud/content?id=1
    router.delete('/crud/content', (Request request) async {
      try {
        int id = int.parse(request.url.queryParameters['id'] ?? '');
        _service.delete(id);
        return Response.ok('Content has been deleted.');
      } catch (error) {
        return Response.badRequest(body: 'Content not deleted');
      }
    });

    return createHandler(
      router: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }
}
