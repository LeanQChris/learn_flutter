// Required by netweork services to parseObject
import 'package:flutter_core/flutter_core.dart';
import 'package:learn_flutter/modules/page/data/model/page.dart';

class PageDataEntityParser extends EntityParser<PageData> {
  @override
  PageData parseObject(Map<String, dynamic> json) {
    return PageData();
  }
}
