import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

/// Applies a theme to descendant Syncfusion datagrid widgets.
class SfDataGridTheme extends InheritedTheme {
  const SfDataGridTheme({Key key, this.data, this.child})
      : super(key: key, child: child);

  /// Specifies the color and typography values for descendant datagrid widgets.
  final SfDataGridThemeData data;

  /// Specifies a widget that can hold single child.
  @override
  final Widget child;

  /// The data from the closest [SfDataGridTheme]
  /// instance that encloses the given context.
  ///
  /// Defaults to [SfThemeData.dataGridThemeData] if there
  /// is no [SfDataGridTheme] in the given build context.
  static SfDataGridThemeData of(BuildContext context) {
    final SfDataGridTheme sfDataGridTheme =
        context.dependOnInheritedWidgetOfExactType<SfDataGridTheme>();
    return sfDataGridTheme?.data ?? SfTheme.of(context).dataGridThemeData;
  }

  @override
  bool updateShouldNotify(SfDataGridTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final SfDataGridTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<SfDataGridTheme>();
    return identical(this, ancestorTheme)
        ? child
        : SfDataGridTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for a [SfDataGridTheme]. Use
///  this class to configure a [SfDataGridTheme] widget
///
/// To obtain the current theme, use [SfDataGridTheme.of]
class SfDataGridThemeData with Diagnosticable {
  factory SfDataGridThemeData(
      {Brightness brightness,
      DataGridHeaderCellStyle headerStyle,
      DataGridCellStyle cellStyle,
      Color gridLineColor,
      double gridLineStrokeWidth,
      DataGridCellStyle selectionStyle,
      DataGridCurrentCellStyle currentCellStyle}) {
    brightness = brightness ?? Brightness.light;
    final bool isLight = brightness == Brightness.light;
    headerStyle ??= isLight
        ? const DataGridHeaderCellStyle(
            textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black87),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1))
        : const DataGridHeaderCellStyle(
            textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromRGBO(255, 255, 255, 1)),
            backgroundColor: Color.fromRGBO(33, 33, 33, 1));
    cellStyle ??= isLight
        ? const DataGridCellStyle(
            textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black87),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1))
        : const DataGridCellStyle(
            textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromRGBO(255, 255, 255, 1)),
            backgroundColor: Color.fromRGBO(33, 33, 33, 1));

    gridLineColor ??= isLight
        ? const Color.fromRGBO(0, 0, 0, 0.26)
        : const Color.fromRGBO(255, 255, 255, 0.26);

    gridLineStrokeWidth ??= 1;

    selectionStyle ??= isLight
        ? DataGridCellStyle(
            textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                foreground: Paint()
                  ..color = const Color.fromRGBO(0, 0, 0, 0.87)),
            backgroundColor: const Color.fromRGBO(238, 238, 238, 1))
        : DataGridCellStyle(
            textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                foreground: Paint()
                  ..color = const Color.fromRGBO(255, 255, 255, 1)),
            backgroundColor: const Color.fromRGBO(48, 48, 48, 1));

    currentCellStyle ??= isLight
        ? const DataGridCurrentCellStyle(
            borderColor: Color.fromRGBO(0, 0, 0, 0.36), borderWidth: 1.0)
        : const DataGridCurrentCellStyle(
            borderColor: Color.fromRGBO(255, 255, 255, 0.36), borderWidth: 1.0);

    return SfDataGridThemeData.raw(
        brightness: brightness,
        headerStyle: headerStyle,
        cellStyle: cellStyle,
        gridLineColor: gridLineColor,
        gridLineStrokeWidth: gridLineStrokeWidth,
        selectionStyle: selectionStyle,
        currentCellStyle: currentCellStyle);
  }

  /// Create a [SfDataGridThemeData] given a set of exact values.
  /// All the values must be specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [SfDataGridThemeData] constructor.
  const SfDataGridThemeData.raw(
      {@required this.brightness,
      @required this.headerStyle,
      @required this.cellStyle,
      @required this.gridLineColor,
      @required this.gridLineStrokeWidth,
      @required this.selectionStyle,
      @required this.currentCellStyle});

  /// The brightness of the overall theme of the
  /// application for the datagrid widgets.
  final Brightness brightness;

  /// Specifies the style for header.
  final DataGridHeaderCellStyle headerStyle;

  /// Specifies the style for cell.
  final DataGridCellStyle cellStyle;

  /// Specifies the color for grid line.
  final Color gridLineColor;

  /// Specifies the width for grid line.
  final double gridLineStrokeWidth;

  /// Specifies the style for grid row selection.
  final DataGridCellStyle selectionStyle;

  /// Specifies the style for current cell selection.
  final DataGridCurrentCellStyle currentCellStyle;

  /// Creates a copy of this theme but with the given
  /// fields replaced with the new values.
  SfDataGridThemeData copyWith(
      {Brightness brightness,
      DataGridHeaderCellStyle headerStyle,
      DataGridCellStyle cellStyle,
      Color gridLineColor,
      double gridLineStrokeWidth,
      DataGridCellStyle selectionStyle,
      DataGridCurrentCellStyle currentCellStyle}) {
    return SfDataGridThemeData.raw(
        brightness: brightness ?? this.brightness,
        headerStyle: headerStyle ?? this.headerStyle,
        cellStyle: cellStyle ?? this.cellStyle,
        gridLineColor: gridLineColor ?? this.gridLineColor,
        gridLineStrokeWidth: gridLineStrokeWidth ?? this.gridLineStrokeWidth,
        selectionStyle: selectionStyle ?? this.selectionStyle,
        currentCellStyle: currentCellStyle ?? this.currentCellStyle);
  }

  static SfDataGridThemeData lerp(
      SfDataGridThemeData a, SfDataGridThemeData b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return SfDataGridThemeData(
        headerStyle:
            DataGridHeaderCellStyle.lerp(a.headerStyle, b.headerStyle, t),
        cellStyle: DataGridCellStyle.lerp(a.cellStyle, b.cellStyle, t),
        gridLineColor: Color.lerp(a.gridLineColor, b.gridLineColor, t),
        gridLineStrokeWidth:
            lerpDouble(a.gridLineStrokeWidth, b.gridLineStrokeWidth, t),
        selectionStyle:
            DataGridCellStyle.lerp(a.selectionStyle, b.selectionStyle, t),
        currentCellStyle: DataGridCurrentCellStyle.lerp(
            a.currentCellStyle, b.currentCellStyle, t));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SfDataGridThemeData typedOther = other;
    return typedOther.brightness == brightness &&
        typedOther.headerStyle == headerStyle &&
        typedOther.cellStyle == cellStyle &&
        typedOther.gridLineColor == gridLineColor &&
        typedOther.gridLineStrokeWidth == gridLineStrokeWidth &&
        typedOther.selectionStyle == selectionStyle &&
        typedOther.currentCellStyle == currentCellStyle;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      headerStyle,
      cellStyle,
      gridLineColor,
      gridLineStrokeWidth,
      selectionStyle,
      currentCellStyle
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final SfDataGridThemeData defaultData = SfDataGridThemeData();
    properties.add(EnumProperty<Brightness>('brightness', brightness,
        defaultValue: defaultData.brightness));
    properties.add(DiagnosticsProperty<DataGridHeaderCellStyle>(
        'headerStyle', headerStyle,
        defaultValue: defaultData.headerStyle));
    properties.add(DiagnosticsProperty<DataGridCellStyle>(
        'cellStyle', cellStyle,
        defaultValue: defaultData.cellStyle));
    properties.add(ColorProperty('gridLineColor', gridLineColor,
        defaultValue: defaultData.gridLineColor));
    properties.add(DoubleProperty('gridLineStrokeWidth', gridLineStrokeWidth,
        defaultValue: defaultData.gridLineStrokeWidth));
    properties.add(DiagnosticsProperty<DataGridCellStyle>(
        'selectionStyle', selectionStyle,
        defaultValue: defaultData.selectionStyle));
    properties.add(DiagnosticsProperty<DataGridCurrentCellStyle>(
        'currentCellStyle', currentCellStyle,
        defaultValue: defaultData.currentCellStyle));
  }
}

/// Applies a style to descendant Syncfusion datagrid gridcell.
class DataGridCellStyle {
  const DataGridCellStyle({this.backgroundColor, this.textStyle});

  /// Specifies the background color of datagrid gridcell.
  final Color backgroundColor;

  /// Specify the datagrid gridcell text style.
  final TextStyle textStyle;

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      textStyle,
      backgroundColor,
    ];
    return hashList(values);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is DataGridCellStyle &&
        other.backgroundColor == backgroundColor &&
        other.textStyle == textStyle;
  }

  static DataGridCellStyle lerp(
      DataGridCellStyle a, DataGridCellStyle b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return DataGridCellStyle(
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
        textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t));
  }
}

/// Applies a style to descendant Syncfusion datagrid headercell.
class DataGridHeaderCellStyle extends DataGridCellStyle {
  const DataGridHeaderCellStyle({Color backgroundColor, TextStyle textStyle})
      : super(backgroundColor: backgroundColor, textStyle: textStyle);

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      textStyle,
      backgroundColor,
    ];
    return hashList(values);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is DataGridHeaderCellStyle &&
        other.backgroundColor == backgroundColor &&
        other.textStyle == textStyle;
  }

  static DataGridHeaderCellStyle lerp(
      DataGridHeaderCellStyle a, DataGridHeaderCellStyle b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return DataGridHeaderCellStyle(
        backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
        textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t));
  }
}

class DataGridCurrentCellStyle {
  const DataGridCurrentCellStyle({this.borderColor, this.borderWidth});

  final Color borderColor;
  final double borderWidth;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is DataGridCurrentCellStyle &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      borderColor,
      borderWidth,
    ];
    return hashList(values);
  }

  static DataGridCurrentCellStyle lerp(
      DataGridCurrentCellStyle a, DataGridCurrentCellStyle b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return DataGridCurrentCellStyle(
        borderColor: Color.lerp(a.borderColor, b.borderColor, t),
        borderWidth: lerpDouble(a.borderWidth, b.borderWidth, t));
  }
}
