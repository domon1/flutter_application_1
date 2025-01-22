import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;

class GetDocs extends StatefulWidget {
  const GetDocs({super.key});

  @override
  State<GetDocs> createState() => _GetDocsState();
}

class _GetDocsState extends State<GetDocs> {
  Uri link = Uri.tryParse("https://domon1.github.io/docs/README.md") ?? Uri();
  @override
  Widget build(BuildContext context) {
    

    return Center(
            child: FutureBuilder<http.Response>(
                future: http.get(link),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String markdown = snapshot.data?.body ?? "";
                    return MarkdownBody(
                        data: markdown,
                        imageBuilder: (uri, title, alt) {
                          Uri? newUri;

                          if (!uri.isAbsolute) {
                            newUri = Uri(
                                  scheme: link.scheme,
                                  host: link.host,
                                  path: 'md_example/${uri.path}');
                          }
                          return Image.network((newUri ?? uri).toString());
                        });
                  } else if (snapshot.hasError) {
                    return Text('Ошибка: ${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }));
  }
}