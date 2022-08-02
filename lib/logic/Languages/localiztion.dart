import 'package:get/route_manager.dart';
import 'package:st/logic/Languages/ar.dart';
import 'package:st/logic/Languages/en.dart';
import 'package:st/logic/Languages/fr.dart';

import '../../utils/my_constant.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
