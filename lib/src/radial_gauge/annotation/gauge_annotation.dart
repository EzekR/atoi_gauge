part of gauges;

/// [RadialAxis] allows to add widgets such as text and image as an annotation to a specific
/// point of interest in the radial gauge.
///
/// [GaugeAnnotation] provides options to add any image, text or other widget over a
/// gauge widget with respect to [angle] or [axisValue]. Display the current progress or pointer value inside the gauge
/// using a text widget annotation.
///
/// ```dart
/// Widget build(BuildContext context) {
///    return Container(
///        child: SfRadialGauge(
///          axes:<RadialAxis>[RadialAxis(
///            annotations: <GaugeAnnotation>[
///            GaugeAnnotation(widget: Text('Annotation'))
///            ]
///            )]
///        ));
///}
/// ```
class GaugeAnnotation {
  /// Create an [GaugeAnnotation] with the required properties.
  ///
  /// The arguments [positionFactor] must not be null and [positionFactor] must be non-negative.
  GaugeAnnotation(
      {this.widget,
      this.axisValue,
      this.horizontalAlignment = GaugeAlignment.center,
      this.angle,
      this.verticalAlignment = GaugeAlignment.center,
      this.positionFactor = 0})
      : assert(positionFactor != null, 'Position factor must not be null.'),
        assert(
            positionFactor >= 0, 'Position factor must be greater than zero.') {
    _opacity = 0;
    _left = 0;
    _top = 0;
    _isOldAnnotation = false;
  }

  /// Specifies the annotation widget.
  ///
  /// Applied widget added over a gauge with respect to [angle] or [axisValue].
  ///
  /// Defaults to null
  ///
  /// ```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis
  ///            annotations: <GaugeAnnotation>[
  ///            GaugeAnnotation(widget: Text('Annotation'))])]
  ///        ));
  ///}
  /// ```
  final Widget widget;

  /// Specifies the axis value for positioning annotation.
  ///
  /// The direction of placing annotation is determined by the [axisValue], if the [angle] is not specified.
  /// The distance is calculated by [positionFactor]. The annotation is positioned on the basis
  /// of the calculated direction and distance.
  ///
  /// Defaults to null
  ///
  /// ```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis
  ///            annotations: <GaugeAnnotation>[
  ///            GaugeAnnotation(widget: Text('Annotation'), axisValue: 20)])]
  ///        ));
  ///}
  /// ```
  final double axisValue;

  /// How the annotation should be aligned horizontally in the respective position.
  ///
  /// * [GaugeAlignment.center] aligns the annotation widget to center.
  /// * [GaugeAlignment.near] aligns the annotation widget to near.
  /// * [GaugeAlignment.far] aligns the annotation widget to far.
  ///
  /// Defaults to [GaugeAlignment.center]
  ///
  /// Also refer [GaugeAlignment]
  ///
  /// ```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis
  ///            annotations: <GaugeAnnotation>[
  ///            GaugeAnnotation(widget: Text('Annotation'), horizontalAlignment: GaugeAlignment.near)])]
  ///        ));
  ///}
  /// ```
  final GaugeAlignment horizontalAlignment;

  /// How the annotation should be aligned vertically in the respective position.
  ///
  /// * [GaugeAlignment.center] aligns the annotation widget to center.
  /// * [GaugeAlignment.near] aligns the annotation widget to near.
  /// * [GaugeAlignment.far] aligns the annotation widget to far.
  ///
  /// Defaults to [GaugeAlignment.center]
  ///
  /// Also refer [GaugeAlignment]
  ///
  /// ```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis
  ///            annotations: <GaugeAnnotation>[
  ///            GaugeAnnotation(widget: Text('Annotation'), verticalAlignment: GaugeAlignment.far)])]
  ///        ));
  ///}
  /// ```
  final GaugeAlignment verticalAlignment;

  /// Specifies the position of annotation in radius factor.
  ///
  /// [positionFactor] value of 0 is starting from the center and 1 is ending at the edge of the radius.
  ///
  /// [positionFactor] must be between 0 to 1.
  ///
  /// Defaults to 0
  ///
  ///```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis
  ///            annotations: <GaugeAnnotation>[
  ///            GaugeAnnotation(widget: Text('Annotation'), positionFactor: 0.5)])]
  ///        ));
  ///}
  ///```
  final double positionFactor;

  /// Specifies the angle for positioning the annotation
  ///
  /// The direction of placing annotation is determined by the [angle], if the [axisValue] is not specified.
  /// The distance is calculated by [positionFactor]. The annotation is positioned on the basis
  /// of the calculated direction and distance.
  ///
  /// Defaults to null
  ///
  /// ```dart
  ///Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis
  ///            annotations: <GaugeAnnotation>[
  ///            GaugeAnnotation(widget: Text('Annotation'), angle: 190)])]
  ///        ));
  ///}
  /// ```
  final double angle;

  /// Specifies the offset of positioning the annotation
  Offset _annotationPosition;

  /// Specifies the actual angle
  double _angle;

  /// Specifies the radian value of annotation
  double _radian;

  /// Specifies the axis bound to annotation
  RadialAxis _axis;

  /// Specifies the size of annotation widget
  Size _annotationSize;

  /// Specifies the opacity
  double _opacity;

  /// Specifies the left value for positioning the annotation
  double _left;

  /// Specifies the top value for positioning the annotation
  double _top;

  bool _isOldAnnotation;

  /// Calculates the offset for positioning the annotation
  void _calculatePosition() {
    final double _value = positionFactor != null ? positionFactor : 0;
    final double _offset = _value * (_axis._radius);
    _angle = _calculateActualAngle();
    _radian = _degreeToRadian(_angle);
    if (!_axis.canScaleToFit) {
      final double _x = (_axis._axisSize.width / 2) +
          (_offset - (_axis._actualAxisWidth / 2)) * math.cos(_radian) -
          _axis._centerX;
      final double _y = (_axis._axisSize.height / 2) +
          (_offset - (_axis._actualAxisWidth / 2)) * math.sin(_radian) -
          _axis._centerY;
      _annotationPosition = Offset(_x, _y);
    } else {
      final double _x = _axis._axisCenter.dx +
          (_offset - (_axis._actualAxisWidth / 2)) * math.cos(_radian);
      final double _y = _axis._axisCenter.dy +
          (_offset - (_axis._actualAxisWidth / 2)) * math.sin(_radian);
      _annotationPosition = Offset(_x, _y);
    }
  }

  /// Calculates the actual angle value
  double _calculateActualAngle() {
    double _actualValue = 0;
    if (angle != null) {
      _actualValue = angle;
    } else if (axisValue != null) {
      // Calculates the current angle based on the provided axis value
      _actualValue = (_axis.valueToFactor(axisValue) * _axis._sweepAngle) +
          _axis.startAngle;
    }

    return _actualValue;
  }
}
