import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

/// Applies a theme to descendant Syncfusion maps widgets.
class SfMapsTheme extends InheritedTheme {
  const SfMapsTheme({Key key, this.data, this.child})
      : super(key: key, child: child);

  /// Specifies the color and typography values for descendant maps widgets.
  final SfMapsThemeData data;

  /// Specifies a widget that can hold single child.
  @override
  final Widget child;

  /// The data from the closest [SfMapsTheme] instance
  /// that encloses the given context.
  ///
  /// Defaults to [SfThemeData.mapsThemeData] if there is no
  /// [SfMapsTheme] in the given build context.
  static SfMapsThemeData of(BuildContext context) {
    final SfMapsTheme mapsTheme =
        context.dependOnInheritedWidgetOfExactType<SfMapsTheme>();
    return mapsTheme?.data ?? SfTheme.of(context).mapsThemeData;
  }

  @override
  bool updateShouldNotify(SfMapsTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final SfMapsTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<SfMapsTheme>();
    return identical(this, ancestorTheme)
        ? child
        : SfMapsTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for a [SfMapsTheme]. Use
///  this class to configure a [SfMapsTheme] widget
///
/// To obtain the current theme, use [SfMapsTheme.of].
class SfMapsThemeData with Diagnosticable {
  factory SfMapsThemeData(
      {Brightness brightness,
      TextStyle titleTextStyle,
      Color layerColor,
      Color layerStrokeColor,
      double layerStrokeWidth,
      TextStyle legendTextStyle,
      Color markerIconColor,
      Color markerIconStrokeColor,
      double markerIconStrokeWidth,
      TextStyle dataLabelTextStyle,
      Color bubbleColor,
      Color bubbleStrokeColor,
      double bubbleStrokeWidth,
      Color selectionColor,
      Color selectionStrokeColor,
      double selectionStrokeWidth,
      TextStyle tooltipTextStyle,
      Color tooltipColor,
      Color tooltipStrokeColor,
      double tooltipStrokeWidth,
      Color toggledShapeColor,
      Color toggledShapeStrokeColor,
      double toggledShapeStrokeWidth}) {
    brightness = brightness ?? Brightness.light;
    final bool isLight = brightness == Brightness.light;
    layerColor ??= isLight
        ? const Color.fromRGBO(224, 224, 224, 1)
        : const Color.fromRGBO(97, 97, 97, 1);
    layerStrokeColor ??= isLight
        ? const Color.fromRGBO(158, 158, 158, 0.5)
        : const Color.fromRGBO(224, 224, 224, 0.5);
    layerStrokeWidth ??= 1.0;
    markerIconColor ??= isLight
        ? const Color.fromRGBO(98, 0, 238, 1)
        : const Color.fromRGBO(187, 134, 252, 1);
    markerIconStrokeWidth ??= 1.0;
    bubbleColor ??= isLight
        ? const Color.fromRGBO(98, 0, 238, 0.5)
        : const Color.fromRGBO(187, 134, 252, 0.8);
    bubbleStrokeWidth ??= 1.0;
    selectionColor ??= isLight
        ? const Color.fromRGBO(117, 117, 117, 1)
        : const Color.fromRGBO(224, 224, 224, 1);
    selectionStrokeColor ??= isLight
        ? const Color.fromRGBO(158, 158, 158, 1)
        : const Color.fromRGBO(97, 97, 97, 1);
    selectionStrokeWidth ??= 0.5;
    tooltipColor ??= isLight
        ? const Color.fromRGBO(117, 117, 117, 1)
        : const Color.fromRGBO(245, 245, 245, 1);
    tooltipStrokeWidth ??= 1.0;
    toggledShapeColor ??= isLight
        ? const Color.fromRGBO(245, 245, 245, 1)
        : const Color.fromRGBO(66, 66, 66, 1);
    toggledShapeStrokeColor ??= isLight
        ? const Color.fromRGBO(158, 158, 158, 1)
        : const Color.fromRGBO(97, 97, 97, 1);

    return SfMapsThemeData.raw(
        brightness: brightness,
        titleTextStyle: titleTextStyle,
        layerColor: layerColor,
        layerStrokeColor: layerStrokeColor,
        legendTextStyle: legendTextStyle,
        markerIconColor: markerIconColor,
        markerIconStrokeColor: markerIconStrokeColor,
        dataLabelTextStyle: dataLabelTextStyle,
        bubbleColor: bubbleColor,
        bubbleStrokeColor: bubbleStrokeColor,
        bubbleStrokeWidth: bubbleStrokeWidth,
        selectionColor: selectionColor,
        selectionStrokeColor: selectionStrokeColor,
        tooltipTextStyle: tooltipTextStyle,
        tooltipColor: tooltipColor,
        tooltipStrokeColor: tooltipStrokeColor,
        tooltipStrokeWidth: tooltipStrokeWidth,
        selectionStrokeWidth: selectionStrokeWidth,
        layerStrokeWidth: layerStrokeWidth,
        markerIconStrokeWidth: markerIconStrokeWidth,
        toggledShapeColor: toggledShapeColor,
        toggledShapeStrokeColor: toggledShapeStrokeColor,
        toggledShapeStrokeWidth: toggledShapeStrokeWidth);
  }

  /// Create a [SfMapsThemeData] given a set of exact values.
  /// All the values must be specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [SfMapsThemeData] constructor.
  const SfMapsThemeData.raw(
      {@required this.brightness,
      @required this.titleTextStyle,
      @required this.layerColor,
      @required this.layerStrokeColor,
      @required this.layerStrokeWidth,
      @required this.legendTextStyle,
      @required this.markerIconColor,
      @required this.markerIconStrokeColor,
      @required this.markerIconStrokeWidth,
      @required this.dataLabelTextStyle,
      @required this.bubbleColor,
      @required this.bubbleStrokeColor,
      @required this.bubbleStrokeWidth,
      @required this.selectionColor,
      @required this.selectionStrokeColor,
      @required this.selectionStrokeWidth,
      @required this.tooltipTextStyle,
      @required this.tooltipColor,
      @required this.tooltipStrokeColor,
      @required this.tooltipStrokeWidth,
      @required this.toggledShapeColor,
      @required this.toggledShapeStrokeColor,
      @required this.toggledShapeStrokeWidth});

  /// The brightness of the overall theme of the
  /// application for the maps widgets.
  final Brightness brightness;

  /// Specifies the text style of the title.
  final TextStyle titleTextStyle;

  /// Specifies the fill color for maps layer.
  final Color layerColor;

  /// Specifies the stroke color for maps layer.
  final Color layerStrokeColor;

  /// Specifies the stroke width for maps layer.
  final double layerStrokeWidth;

  /// Specifies the text style of the legend.
  final TextStyle legendTextStyle;

  /// Specifies the fill color for marker icon.
  final Color markerIconColor;

  /// Specifies the stroke color for marker icon.
  final Color markerIconStrokeColor;

  /// Specifies the stroke width for marker icon.
  final double markerIconStrokeWidth;

  /// Specifies the TextStyle for data label.
  final TextStyle dataLabelTextStyle;

  /// Specifies the fill color for bubble.
  final Color bubbleColor;

  /// Specifies the stroke color for bubble.
  final Color bubbleStrokeColor;

  /// Specifies the stroke width for bubble.
  final double bubbleStrokeWidth;

  /// Specifies the fill color for selected shape.
  final Color selectionColor;

  /// Specifies the stroke color for selected shape.
  final Color selectionStrokeColor;

  /// Specifies the stroke width for selected shape.
  final double selectionStrokeWidth;

  /// Specifies the textStyle for tooltip text.
  final TextStyle tooltipTextStyle;

  /// Specifies the fill color for tooltip.
  final Color tooltipColor;

  /// Specifies the stroke color for tooltip.
  final Color tooltipStrokeColor;

  /// Specifies the stroke width for tooltip.
  final double tooltipStrokeWidth;

  final Color toggledShapeColor;

  final Color toggledShapeStrokeColor;

  final double toggledShapeStrokeWidth;

  /// Creates a copy of this theme but with the given
  /// fields replaced with the new values.
  SfMapsThemeData copyWith({
    Brightness brightness,
    TextStyle titleTextStyle,
    Color layerColor,
    Color layerStrokeColor,
    double layerStrokeWidth,
    TextStyle legendTextStyle,
    Color markerIconColor,
    Color markerIconStrokeColor,
    double markerIconStrokeWidth,
    TextStyle dataLabelTextStyle,
    Color bubbleColor,
    Color bubbleStrokeColor,
    double bubbleStrokeWidth,
    Color selectionColor,
    Color selectionStrokeColor,
    double selectionStrokeWidth,
    TextStyle tooltipTextStyle,
    Color tooltipColor,
    Color tooltipStrokeColor,
    double tooltipStrokeWidth,
    Color toggledShapeColor,
    Color toggledShapeStrokeColor,
    double toggledShapeStrokeWidth,
  }) {
    return SfMapsThemeData.raw(
      brightness: brightness ?? this.brightness,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      layerColor: layerColor ?? this.layerColor,
      layerStrokeColor: layerStrokeColor ?? this.layerStrokeColor,
      layerStrokeWidth: layerStrokeWidth ?? this.layerStrokeWidth,
      legendTextStyle: legendTextStyle ?? this.legendTextStyle,
      markerIconColor: markerIconColor ?? this.markerIconColor,
      markerIconStrokeColor:
          markerIconStrokeColor ?? this.markerIconStrokeColor,
      markerIconStrokeWidth:
          markerIconStrokeWidth ?? this.markerIconStrokeWidth,
      dataLabelTextStyle: dataLabelTextStyle ?? this.dataLabelTextStyle,
      bubbleColor: bubbleColor ?? this.bubbleColor,
      bubbleStrokeColor: bubbleStrokeColor ?? this.bubbleStrokeColor,
      bubbleStrokeWidth: bubbleStrokeWidth ?? this.bubbleStrokeWidth,
      selectionColor: selectionColor ?? this.selectionColor,
      selectionStrokeColor: selectionStrokeColor ?? this.selectionStrokeColor,
      selectionStrokeWidth: selectionStrokeWidth ?? this.selectionStrokeWidth,
      tooltipTextStyle: tooltipTextStyle ?? this.tooltipTextStyle,
      tooltipColor: tooltipColor ?? this.tooltipColor,
      tooltipStrokeColor: tooltipStrokeColor ?? this.tooltipStrokeColor,
      tooltipStrokeWidth: tooltipStrokeWidth ?? this.tooltipStrokeWidth,
      toggledShapeColor: toggledShapeColor ?? this.toggledShapeColor,
      toggledShapeStrokeColor:
          toggledShapeStrokeColor ?? this.toggledShapeStrokeColor,
      toggledShapeStrokeWidth:
          toggledShapeStrokeWidth ?? this.toggledShapeStrokeWidth,
    );
  }

  static SfMapsThemeData lerp(SfMapsThemeData a, SfMapsThemeData b, double t) {
    assert(t != null);
    if (a == null && b == null) {
      return null;
    }
    return SfMapsThemeData(
      titleTextStyle: TextStyle.lerp(a.titleTextStyle, b.titleTextStyle, t),
      layerColor: Color.lerp(a.layerColor, b.layerColor, t),
      layerStrokeColor: Color.lerp(a.layerStrokeColor, b.layerStrokeColor, t),
      layerStrokeWidth: lerpDouble(a.layerStrokeWidth, b.layerStrokeWidth, t),
      legendTextStyle: TextStyle.lerp(a.legendTextStyle, b.legendTextStyle, t),
      markerIconColor: Color.lerp(a.markerIconColor, b.markerIconColor, t),
      markerIconStrokeColor:
          Color.lerp(a.markerIconStrokeColor, b.markerIconStrokeColor, t),
      markerIconStrokeWidth:
          lerpDouble(a.markerIconStrokeWidth, b.markerIconStrokeWidth, t),
      dataLabelTextStyle:
          TextStyle.lerp(a.dataLabelTextStyle, b.dataLabelTextStyle, t),
      bubbleColor: Color.lerp(a.bubbleColor, b.bubbleColor, t),
      bubbleStrokeColor:
          Color.lerp(a.bubbleStrokeColor, b.bubbleStrokeColor, t),
      bubbleStrokeWidth:
          lerpDouble(a.bubbleStrokeWidth, b.bubbleStrokeWidth, t),
      selectionColor: Color.lerp(a.selectionColor, b.selectionColor, t),
      selectionStrokeColor:
          Color.lerp(a.selectionStrokeColor, b.selectionStrokeColor, t),
      selectionStrokeWidth:
          lerpDouble(a.selectionStrokeWidth, b.selectionStrokeWidth, t),
      tooltipTextStyle:
          TextStyle.lerp(a.tooltipTextStyle, b.tooltipTextStyle, t),
      tooltipColor: Color.lerp(a.tooltipColor, b.tooltipColor, t),
      tooltipStrokeColor:
          Color.lerp(a.tooltipStrokeColor, b.tooltipStrokeColor, t),
      tooltipStrokeWidth:
          lerpDouble(a.tooltipStrokeWidth, b.tooltipStrokeWidth, t),
      toggledShapeColor:
          Color.lerp(a.toggledShapeColor, b.toggledShapeColor, t),
      toggledShapeStrokeColor:
          Color.lerp(a.toggledShapeStrokeColor, b.toggledShapeStrokeColor, t),
      toggledShapeStrokeWidth:
          lerpDouble(a.toggledShapeStrokeWidth, b.toggledShapeStrokeWidth, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final SfMapsThemeData typedOther = other;
    return typedOther.titleTextStyle == titleTextStyle &&
        typedOther.layerColor == layerColor &&
        typedOther.layerStrokeColor == layerStrokeColor &&
        typedOther.layerStrokeWidth == layerStrokeWidth &&
        typedOther.legendTextStyle == legendTextStyle &&
        typedOther.markerIconColor == markerIconColor &&
        typedOther.markerIconStrokeColor == markerIconStrokeColor &&
        typedOther.markerIconStrokeWidth == markerIconStrokeWidth &&
        typedOther.dataLabelTextStyle == dataLabelTextStyle &&
        typedOther.bubbleColor == bubbleColor &&
        typedOther.bubbleStrokeColor == bubbleStrokeColor &&
        typedOther.bubbleStrokeWidth == bubbleStrokeWidth &&
        typedOther.selectionColor == selectionColor &&
        typedOther.selectionStrokeColor == selectionStrokeColor &&
        typedOther.selectionStrokeWidth == selectionStrokeWidth &&
        typedOther.tooltipTextStyle == tooltipTextStyle &&
        typedOther.tooltipColor == tooltipColor &&
        typedOther.tooltipStrokeColor == tooltipStrokeColor &&
        typedOther.tooltipStrokeWidth == tooltipStrokeWidth &&
        typedOther.toggledShapeColor == toggledShapeColor &&
        typedOther.toggledShapeStrokeColor == toggledShapeStrokeColor &&
        typedOther.toggledShapeStrokeWidth == toggledShapeStrokeWidth;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      titleTextStyle,
      layerColor,
      layerStrokeColor,
      layerStrokeWidth,
      legendTextStyle,
      markerIconColor,
      markerIconStrokeColor,
      markerIconStrokeWidth,
      dataLabelTextStyle,
      bubbleColor,
      bubbleStrokeColor,
      bubbleStrokeWidth,
      selectionColor,
      selectionStrokeColor,
      selectionStrokeWidth,
      tooltipTextStyle,
      tooltipColor,
      tooltipStrokeColor,
      tooltipStrokeWidth,
      toggledShapeColor,
      toggledShapeStrokeColor,
      toggledShapeStrokeWidth,
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final SfMapsThemeData defaultData = SfMapsThemeData();
    properties.add(EnumProperty<Brightness>('brightness', brightness,
        defaultValue: defaultData.brightness));
    properties.add(DiagnosticsProperty<TextStyle>(
        'titleTextStyle', titleTextStyle,
        defaultValue: defaultData.titleTextStyle));
    properties.add(ColorProperty('layerColor', layerColor,
        defaultValue: defaultData.layerColor));
    properties.add(ColorProperty('layerStrokeColor', layerStrokeColor,
        defaultValue: defaultData.layerStrokeColor));
    properties.add(DoubleProperty('layerStrokeWidth', layerStrokeWidth,
        defaultValue: defaultData.layerStrokeWidth));
    properties.add(DiagnosticsProperty<TextStyle>(
        'legendTextStyle', legendTextStyle,
        defaultValue: defaultData.legendTextStyle));
    properties.add(ColorProperty('markerIconColor', markerIconColor,
        defaultValue: defaultData.markerIconColor));
    properties.add(ColorProperty('markerIconStrokeColor', markerIconStrokeColor,
        defaultValue: defaultData.markerIconStrokeColor));
    properties.add(DoubleProperty(
        'markerIconStrokeWidth', markerIconStrokeWidth,
        defaultValue: defaultData.markerIconStrokeWidth));
    properties.add(DiagnosticsProperty<TextStyle>(
        'dataLabelTextStyle', dataLabelTextStyle,
        defaultValue: defaultData.dataLabelTextStyle));
    properties.add(ColorProperty('bubbleColor', bubbleColor,
        defaultValue: defaultData.bubbleColor));
    properties.add(ColorProperty('bubbleStrokeColor', bubbleStrokeColor,
        defaultValue: defaultData.bubbleStrokeColor));
    properties.add(DoubleProperty('bubbleStrokeWidth', bubbleStrokeWidth,
        defaultValue: defaultData.bubbleStrokeWidth));
    properties.add(ColorProperty('selectionColor', selectionColor,
        defaultValue: defaultData.selectionColor));
    properties.add(ColorProperty('selectionStrokeColor', selectionStrokeColor,
        defaultValue: defaultData.selectionStrokeColor));
    properties.add(DoubleProperty('selectionStrokeWidth', selectionStrokeWidth,
        defaultValue: defaultData.selectionStrokeWidth));
    properties.add(DiagnosticsProperty<TextStyle>(
        'tooltipTextStyle', tooltipTextStyle,
        defaultValue: defaultData.tooltipTextStyle));
    properties.add(ColorProperty('tooltipColor', tooltipColor,
        defaultValue: defaultData.tooltipColor));
    properties.add(ColorProperty('tooltipStrokeColor', tooltipStrokeColor,
        defaultValue: defaultData.tooltipStrokeColor));
    properties.add(DoubleProperty('tooltipStrokeWidth', tooltipStrokeWidth,
        defaultValue: defaultData.tooltipStrokeWidth));
    properties.add(ColorProperty('toggledShapeColor', toggledShapeColor,
        defaultValue: defaultData.toggledShapeColor));
    properties.add(ColorProperty(
        'toggledShapeStrokeColor', toggledShapeStrokeColor,
        defaultValue: defaultData.toggledShapeStrokeColor));
    properties.add(DoubleProperty(
        'toggledShapeStrokeWidth', toggledShapeStrokeWidth,
        defaultValue: defaultData.toggledShapeStrokeWidth));
  }
}
