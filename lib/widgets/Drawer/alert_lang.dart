import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mokhtabary/Language/Config/config-lang.dart';
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/utils/path_image.dart';

import 'alert_flag.dart';

class ALertDialogDrawer extends StatelessWidget {
  const ALertDialogDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      title: Text(
        KeyLang.selectLanguage.tr(),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FlagDrawer(
                title: KeyLang.arabic,
                flag: PathImage.jordan,
                lang: ConfigLanguage.AR_LOCALE,
              ),
            ),
            Expanded(
              child: FlagDrawer(
                title: KeyLang.english,
                flag: PathImage.unitedStates,
                lang: ConfigLanguage.EN_LOCALE,
              ),
            )
          ],
        ),
      ),
    );
  }
}
