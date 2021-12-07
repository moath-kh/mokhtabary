import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
//  DataType ?
// !

class FlagDrawer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FlagDrawer(
      {required String title, required String flag, required Locale lang})
      : _title = title,
        _lang = lang,
        _flag = flag;

  final String _flag;
  final String _title;
  final Locale _lang;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EasyLocalization.of(context)!.setLocale(_lang);
        Navigator.pop(context);
      },
      child: Column(
        children: [
          // * Flag
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(_flag)),
            ),
          ),
          Text(_title.tr())
        ],
      ),
    );
  }
}


 /*showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return ALertDialogDrawer();
                    },
                  ); */
