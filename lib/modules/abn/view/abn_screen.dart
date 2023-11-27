import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_netwok_module/flutter_netwok_module.dart';
import 'package:learn_flutter/app/helpers/parse_abn.dart';
import 'package:learn_flutter/app/network/network_base.dart';
import 'package:learn_flutter/modules/abn/data/api/abn_detail_entity_parser.dart';
import 'package:learn_flutter/modules/abn/data/api/get_abn_detail_api.dart';
import 'package:learn_flutter/modules/abn/data/model/abn_detail.dart';

class AbnScreen extends StatelessWidget {
  const AbnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final abnNumber = TextEditingController(text: "63 655 025 184");

    fetchAbnDetail() async {
      Result<NetworkFailure, NetworkResponseModel> result =
          await abnClient.request(GetAbnDetailAPI(
              abnNumber: abnNumber.text, parser: AbnDetailEntityParser()));
      result.fold((error) => log(error.toString()), (data) {
        Map<String, dynamic> abnDetailData =
            parseAbnSopResponseToJson(data.rowObject["data"]);

        AbnResponse abnDetail = AbnResponse.fromJson(abnDetailData);
      });
    }

    return Scaffold(
        appBar: AppBar(title: const Text("Abn")),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  DesignTextField(
                      placeholderText: "Abn Number",
                      textEditingController: abnNumber),
                  const SizedBox(height: 10),
                  DesignOutlinedButtonLarge(
                      label: "Next", onPressed: fetchAbnDetail)
                ]))));
  }
}
