import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_netwok_module/flutter_netwok_module.dart';
import 'package:html/parser.dart';
import 'package:learn_flutter/app/network/network_base.dart';
import 'package:learn_flutter/modules/page/data/api/entity_parser.dart';
import 'package:learn_flutter/modules/page/data/api/page_request_api.dart';
import 'package:learn_flutter/modules/page/data/model/page.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  Data? pageData;
  // Making an Api call
  fetchTodos() async {
    Result<NetworkFailure, NetworkResponseModel> result = await client.request(
        PageDataApiPath(pageName: 'about', parser: PageDataEntityParser()));
    result.fold((error) => print(error), (NetworkResponseModel<Entity> data) {
      setState(() {
        pageData = Data.fromJson(data.rowObject["data"]);
      });
    });
  }

  @override
  void initState() {
    fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var document = parse(pageData != null ? pageData!.body : "");
    return Scaffold(
        appBar: AppBar(title: Text(pageData?.title ?? "")),
        body: Text(document.outerHtml));
  }
}
