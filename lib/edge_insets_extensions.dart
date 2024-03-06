import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsExtensions on EdgeInsets {
  EdgeInsets operator +(EdgeInsets e) => EdgeInsets.only(top: top + e.top, left: left + e.left, bottom: bottom + e.bottom, right: right + e.right);
  EdgeInsets operator -(EdgeInsets e) => EdgeInsets.only(top: top - e.top, left: left - e.left, bottom: bottom - e.bottom, right: right - e.right);
  Padding asPadding({Widget? child}) => Padding(padding: this, child: child);
}

extension EdgeInsetsExtensionsForNum on num {
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
}
