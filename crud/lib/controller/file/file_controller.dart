import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:shelf_static/shelf_static.dart';

import 'dart:io';

part 'file_controller.g.dart';

class FilesController {
  @Route.post('/uploadFiles')
  FutureOr<Response> upload(Request request) async {
    var header = HeaderValue.parse(request.headers['content-type']!);
    String? fileName;

    // MimeMultipart => Uma classe Mime Multipart que representa cada parte analisada por MimeMultipartTransformer . Os dados são transmitidos à medida que se tornam disponíveis.

    await for (MimeMultipart part in request.read().transform(
          MimeMultipartTransformer(
            header.parameters['boundary']!,
          ),
        )) {
      // Em uma resposta HTTP regular, o cabeçalho da resposta Content-Disposition é um cabeçalho que indica se o conteúdo deve ser exibido embutido no navegador, ou seja, como uma página da Web ou como parte de uma página da Web, ou como um anexo, que é baixado e salvo localmente.

      if (part.headers.containsKey('content-disposition')) {
        header = HeaderValue.parse(part.headers['content-disposition']!);
        final extension =
            basename(header.parameters['filename']!).split('.').last;
        fileName = Uuid().v4() + '.$extension';
        final file = File('./upload/$fileName');
        await file.create(recursive: true);
        final fileSink = file.openWrite();
        await part.pipe(fileSink);
        await fileSink.close();
      }
    }
    return Response.ok(jsonEncode({'file': fileName!}));
  }

  @Route.get('/<name>')
  FutureOr<Response> getFile(Request request, String name) {
    var handler = createStaticHandler(
      'upload',
    );
    return handler(request);
  }

  Router get router => _$FilesControllerRouter(this);
}
