import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:zr_text/common/date_time.dart';

import '../../gen_l10n/app_localizations.dart';
class Tool{
  late AppLocalizations _appLocalizations;
  late BuildContext context;
  Tool(AppLocalizations appLocalizations,BuildContext context){
    _appLocalizations = appLocalizations;
  }
  ///数值格式化100,000,000
  String number([double? value])=> value==null?"":_appLocalizations.number(value);
  ///年月日国际化
  String yMd([DateTime? dateTime])=> dateTime==null?"":_appLocalizations.yMd(dateTime);
  ///星期国际化
  String week([DateTime? dateTime])=>dateTime==null?"":_appLocalizations.week(dateTime);
  ///缩写星期国际化
  String aabrWeek([DateTime? dateTime])=>dateTime==null?"":_appLocalizations.abbrWeek(dateTime);
  ///12小时制时间国际化
  String jm([DateTime? dateTime])=>dateTime==null?"":_appLocalizations.jm(dateTime);
  ///时间为当日只显示时间
  String datetimeOrTime([DateTime? dateTime]){
    if(dateTime==null) return "";
    int difference = dateTime.calculateDifference()??-1;
    if(difference==0){
      return jm(dateTime);
    }
    return "${yMd(dateTime)} ${jm(dateTime)}";
  }
  //持续时间国际化
  String duration(Duration duration,{
    bool abbreviated=false,
    DurationTersity tersity = DurationTersity.minute
  }){
    final Locale appLocale = Localizations.localeOf(context);
    return printDuration(
      duration,
      abbreviated: abbreviated,
      tersity:tersity,
      locale: DurationLocale.fromLanguageCode(appLocale.languageCode)??
          const EnglishDurationLocale(),
    );
  }
}