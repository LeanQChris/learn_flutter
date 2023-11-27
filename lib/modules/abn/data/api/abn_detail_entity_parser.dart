import 'package:flutter_core/flutter_core.dart';
import 'package:learn_flutter/modules/abn/data/model/abn_detail.dart';

class AbnDetailEntityParser extends EntityParser<AbnResponse> {
  @override
  AbnResponse parseObject(Map<String, dynamic> json) {
    return AbnResponse();
  }
}
