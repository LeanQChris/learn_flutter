import 'package:flutter/services.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';

Localize engLocale = Localize(
    langSymbol: "en", countrySymbol: "US", textDirection: TextDirection.ltr);
Localize nepLocale = Localize(
    langSymbol: "ne", countrySymbol: "NP", textDirection: TextDirection.ltr);

List<Localize> locales = [engLocale, nepLocale];
