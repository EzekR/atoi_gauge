part of gauges;

/// Create the pointer to indicate the value with rounded range bar arc.
///
/// A [RangePointer] is used to indicate the current value relative to the start value of a axis scale.
///
/// ```dart
/// Widget build(BuildContext context) {
///    return Container(
///        child: SfRadialGauge(
///          axes:<RadialAxis>[RadialAxis(
///             pointers: <GaugePointer>[RangePointer( value: 20)],
///            )]
///        ));
///}
/// ```
class RangePointer extends GaugePointer {
  /// Create a range pointer with the default or required properties.
  ///
  /// The arguments [value], [pointerOffset], must not be null and [animationDuration], [width],
  /// must be non-negative.
  RangePointer(
      {double value = 0,
      bool enableDragging,
      ValueChanged<double> onValueChanged,
      ValueChanged<double> onValueChangeStart,
      ValueChanged<double> onValueChangeEnd,
      ValueChanged<ValueChangingArgs> onValueChanging,
      AnimationType animationType,
      this.cornerStyle = CornerStyle.bothFlat,
      this.gradient,
      bool enableAnimation,
      double animationDuration = 1000,
      this.pointerOffset = 0,
      this.sizeUnit = GaugeSizeUnit.logicalPixel,
      this.width = 10,
      this.color})
      : assert(
            animationDuration > 0, 'Animation duration must be non-negative'),
        assert(value != null, 'Value should not be null'),
        assert(width >= 0, 'Width must be a non-negative value.'),
        assert(pointerOffset != null, 'Pointer offset must not be null.'),
        assert(
            (gradient != null && gradient is SweepGradient) || gradient == null,
            'The gradient must be null or else the gradient must be equal to sweep gradient.'),
        super(
            value: value ?? 0,
            enableDragging: enableDragging ?? false,
            animationType: animationType ?? AnimationType.ease,
            onValueChanged: onValueChanged,
            onValueChangeStart: onValueChangeStart,
            onValueChangeEnd: onValueChangeEnd,
            onValueChanging: onValueChanging,
            enableAnimation: enableAnimation ?? false,
            animationDuration: animationDuration ?? 1000);

  /// Adjusts the range pointer position.
  ///
  /// You can specify position value either in logical pixel or radius factor using the [sizeUnit] property.
  /// if [sizeUnit] is [GaugeSizeUnit.factor], value will be given from 0 to 1. Here pointer placing position is calculated by [pointerOffset] * axis radius value.
  ///
  /// Example: [pointerOffset] value is 0.2 and axis radius is 100, pointer is moving 20(0.2 * 100) logical pixels from axis outer radius.
  /// if [sizeUnit] is [GaugeSizeUnit.logicalPixel], defined value distance pointer will move from the outer radius axis.
  ///
  /// When you specify [pointerOffset] is negative, the range pointer will be positioned outside the axis.
  ///
  /// Defaults to 0 and [sizeUnit] is [GaugeSizeUnit.logicalPixel]
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///             pointers: <GaugePointer>[RangePointer(pointerOffset: 30, value: 20)],
  ///            )]
  ///        ));
  ///}
  /// ```
  final double pointerOffset;

  /// Calculates the position and size for pointer either in logical pixel or radius factor.
  ///
  /// Using [GaugeSizeUnit], range pointer position is calculated.
  ///
  /// Defaults to [GaugeSizeUnit.logicalPixel].
  ///
  /// Also refer [GaugeSizeUnit].
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///             pointers: <GaugePointer>[RangePointer(pointerOffset: 0.3,  value: 20,
  ///             sizeUnit: GaugeSizeUnit.factor, width: 0.5
  ///             )],
  ///            )]
  ///        ));
  ///}
  /// ```
  final GaugeSizeUnit sizeUnit;

  /// Specifies the range pointer width.
  ///
  /// You can specify pointer width either in logical pixel or radius factor using the [sizeUnit] property.
  /// if [sizeUnit] is [GaugeSizeUnit.factor], value must be given from 0 to 1. Here pointer width is calculated by [width] * axis radius value.
  ///
  /// Example: [width] value is 0.2 and axis radius is 100, pointer width is 20(0.2 * 100) logical pixels.
  /// if [sizeUnit] is [GaugeSizeUnit.logicalPixel], defined value is set to the pointer width.
  ///
  /// Defaults to 10 and [sizeUnit] is [GaugeSizeUnit.logicalPixel]
  ///
  /// ```Dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///             pointers: <GaugePointer>[RangePointer(width: 20 , value: 20)],
  ///            )]
  ///        ));
  ///}
  /// ```
  final double width;

  /// Specifies the range pointer color.
  ///
  /// Defaults to  null
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///             pointers: <GaugePointer>[RangePointer(
  ///             color: Colors.red , value: 20)],
  ///            )]
  ///        ));
  ///}
  /// ```
  final Color color;

  /// The style to use for the range pointer corner edge.
  ///
  /// [CornerStyle.bothFlat] does not render the rounded corner on both side.
  /// [CornerStyle.bothCurve] renders the rounded corner on both side.
  /// [CornerStyle.startCurve] renders the rounded corner on start side.
  /// [CornerStyle.endCurve] renders the rounded corner on end side.
  ///
  /// Defaults to [CornerStyle.bothFlat]
  ///
  /// Also refer [CornerStyle]
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///             pointers: <GaugePointer>[RangePointer(value: 20,
  ///             cornerStyle: CornerStyle.bothCurve)],
  ///            )]
  ///        ));
  ///}
  /// ```
  final CornerStyle cornerStyle;

  /// A gradient to use when filling the range pointer.
  ///
  /// [gradient] of [RangePointer] only support [SweepGradient] and specified [SweepGradient.stops] are applied within the pointer value.
  ///
  /// Defaults to null
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///             pointers: <GaugePointer>[RangePointer(value: 20,
  ///              gradient:SweepGradient(
  ///             colors: const <Color>[Colors.red, Color(0xFFFFDD00), Color(0xFFFFDD00), Color(0xFF30B32D),],
  ///             stops: const <double>[0, 0.2722222, 0.5833333, 0.777777,],
  ///           ))],
  ///            )]
  ///        ));
  ///}
  /// ```
  final Gradient gradient;

  /// Holds the start arc value
  double _startArc;

  /// Holds the end arc value
  double _endArc;

  /// Holds the actual range thickness
  double _actualRangeThickness;

  /// Specifies the range arc top
  double _rangeArcTop;

  /// Specifies the range arc bottom
  double _rangeArcBottom;

  /// Specifies the range arc left
  double _rangeArcLeft;

  /// Specifies the range arc right
  double _rangeArcRight;

  /// Specifies the arc rect
  Rect _arcRect;

  /// Specifies the arc path
  Path _arcPath;

  /// Specifies the start radian of range arc
  double _startCornerRadian;

  /// Specifies the sweep radian of range arc
  double _sweepCornerRadian;

  /// Specifies the center value for range corner
  double _cornerCenter;

  /// Specifies the angle for corner cap
  double _cornerAngle;

  /// Specifies the actual pointer offset value
  double _actualPointerOffset;

  /// Specifies total offset for the range pointer
  double _totalOffset;

  /// Method to calculate pointer position
  @override
  void _calculatePosition() {
    _currentValue = _minMax(_currentValue, _axis.minimum, _axis.maximum);
    _actualRangeThickness = _axis._calculateActualValue(width, sizeUnit, false);
    _actualPointerOffset =
        _axis._calculateActualValue(pointerOffset, sizeUnit, true);
    _totalOffset = _actualPointerOffset < 0
        ? _axis._calculateAxisOffset() + _actualPointerOffset
        : (_actualPointerOffset + _axis._axisOffset);
    _startArc = (_axis.valueToFactor(_axis.minimum) * _axis._sweepAngle) +
        _axis.startAngle;
    final double _endAngle =
        (_axis.valueToFactor(_currentValue) * _axis._sweepAngle) +
            _axis.startAngle;
    _endArc = _endAngle - _startArc;

    _rangeArcLeft =
        -(_axis._radius - (_actualRangeThickness / 2 + _totalOffset));
    _rangeArcTop =
        -(_axis._radius - (_actualRangeThickness / 2 + _totalOffset));
    _rangeArcRight = _axis._radius - (_actualRangeThickness / 2 + _totalOffset);
    _rangeArcBottom =
        _axis._radius - (_actualRangeThickness / 2 + _totalOffset);

    _createRangeRect();
  }

  /// To creates the arc rect for range pointer
  void _createRangeRect() {
    _arcRect = Rect.fromLTRB(
        _rangeArcLeft, _rangeArcTop, _rangeArcRight, _rangeArcBottom);
    _pointerRect = Rect.fromLTRB(
        _rangeArcLeft, _rangeArcTop, _rangeArcRight, _rangeArcBottom);
    _arcPath = Path();
    _arcPath.arcTo(
        _arcRect, _degreeToRadian(_startArc), _degreeToRadian(_endArc), true);
    _calculateCornerStylePosition();
  }

  /// Calculates the rounded corner position
  void _calculateCornerStylePosition() {
    _cornerCenter = (_arcRect.right - _arcRect.left) / 2;
    _cornerAngle = _cornerRadiusAngle(_cornerCenter, _actualRangeThickness / 2);

    switch (cornerStyle) {
      case CornerStyle.startCurve:
        {
          _startCornerRadian = _axis.isInversed
              ? _degreeToRadian(-_cornerAngle)
              : _degreeToRadian(_cornerAngle);
          _sweepCornerRadian = _axis.isInversed
              ? _degreeToRadian(_endArc + _cornerAngle)
              : _degreeToRadian(_endArc - _cornerAngle);
        }
        break;
      case CornerStyle.endCurve:
        {
          _startCornerRadian = _degreeToRadian(0);
          _sweepCornerRadian = _axis.isInversed
              ? _degreeToRadian(_endArc + _cornerAngle)
              : _degreeToRadian(_endArc - _cornerAngle);
        }
        break;
      case CornerStyle.bothCurve:
        {
          _startCornerRadian = _axis.isInversed
              ? _degreeToRadian(-_cornerAngle)
              : _degreeToRadian(_cornerAngle);
          _sweepCornerRadian = _axis.isInversed
              ? _degreeToRadian(_endArc + 2 * _cornerAngle)
              : _degreeToRadian(_endArc - 2 * _cornerAngle);
        }
        break;
      case CornerStyle.bothFlat:
        {
          _startCornerRadian = _degreeToRadian(_startArc);
          _sweepCornerRadian = _degreeToRadian(_endArc);
        }
        break;
    }
  }

  /// Calculates the range sweep angle
  double _getSweepAngle() {
    return _radianToDegree(_sweepCornerRadian) / _axis._sweepAngle;
  }

  /// Method to draw the range pointer
  /// @override
  void drawPointer(Canvas canvas, double animationValue, Offset startOffset,
      Offset offset, double _angle) {}
}
