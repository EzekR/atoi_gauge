part of gauges;

/// The [RadialAxis] is a circular arc in which a set of values are displayed along a linear or custom scale
/// based on the design requirements.
///
/// ```dart
/// Widget build(BuildContext context) {
///    return Container(
///        child: SfRadialGauge(
///          axes:<RadialAxis>[RadialAxis(
///            )]
///        ));
///}
/// ```
class RadialAxis extends GaugeAxis {
  /// Create [RadialAxis] with the default or required scale range and customized axis properties.
  ///
  /// The arguments [minimum], [maximum], [startAngle], [endAngle], [radiusFactor], [centerX], [centerY],
  /// [tickOffset] and [labelOffset] must not be null. Additionally [centerX], [centerY] must be non-negative
  /// and [maximum] must be creater than [minimum].
  RadialAxis(
      {this.startAngle = 130,
      this.endAngle = 50,
      this.radiusFactor = 0.95,
      this.centerX = 0.5,
      this.onLabelCreated,
      this.onAxisTapped,
      this.needsRotateLabels = false,
      this.centerY = 0.5,
      this.showFirstLabel = true,
      this.showLastLabel = true,
      this.canScaleToFit = false,
      List<GaugeRange> ranges,
      List<GaugePointer> pointers,
      List<GaugeAnnotation> annotations,
      GaugeTextStyle axisLabelStyle,
      AxisLineStyle axisLineStyle,
      MajorTickStyle majorTickStyle,
      MinorTickStyle minorTickStyle,
      this.backgroundImage,
      double minimum = 0,
      double maximum = 100,
      double interval,
      double minorTicksPerInterval,
      bool showLabels,
      bool showAxisLine,
      bool showTicks,
      double tickOffset = 0,
      double labelOffset = 15,
      bool isInversed,
      GaugeSizeUnit offsetUnit,
      num maximumLabels = 3,
      bool useRangeColorForAxis,
      String labelFormat,
      NumberFormat numberFormat,
      ElementsPosition ticksPosition,
      ElementsPosition labelsPosition})
      : assert(minimum != null, 'Minimum must not be null.'),
        assert(maximum != null, 'Maximum must not be null.'),
        assert(startAngle != null, 'Start angle must not be null.'),
        assert(endAngle != null, 'End angle must not be null.'),
        assert(radiusFactor != null, 'Radius factor must not be null.'),
        assert(centerX != null, 'Center X must not be null.'),
        assert(centerY != null, 'Center Y must not be null.'),
        assert(
            radiusFactor >= 0, 'Radius factor must be a non-negative value.'),
        assert(centerX >= 0, 'Center X must be a non-negative value.'),
        assert(centerY >= 0, 'Center Y must be a non-negative value.'),
        assert(minimum < maximum, 'Maximum should be greater than minimum.'),
        assert(tickOffset != null, 'Tick offset should not be equal to null.'),
        assert(labelOffset != null, 'Label offset must not be equal to null.'),
        super(
            ranges: ranges,
            annotations: annotations,
            pointers: pointers,
            minimum: minimum,
            maximum: maximum,
            interval: interval,
            minorTicksPerInterval: minorTicksPerInterval ?? 1,
            showLabels: showLabels ?? true,
            showAxisLine: showAxisLine ?? true,
            showTicks: showTicks ?? true,
            tickOffset: tickOffset,
            labelOffset: labelOffset,
            isInversed: isInversed ?? false,
            maximumLabels: maximumLabels,
            useRangeColorForAxis: useRangeColorForAxis ?? false,
            labelFormat: labelFormat,
            offsetUnit: offsetUnit ?? GaugeSizeUnit.logicalPixel,
            numberFormat: numberFormat,
            ticksPosition: ticksPosition ?? ElementsPosition.inside,
            labelsPosition: labelsPosition ?? ElementsPosition.inside,
            axisLabelStyle: axisLabelStyle ??
                GaugeTextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Segoe UI',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
            axisLineStyle: axisLineStyle ??
                AxisLineStyle(
                  thickness: 10,
                ),
            majorTickStyle: majorTickStyle ?? MajorTickStyle(),
            minorTickStyle: minorTickStyle ?? MinorTickStyle()) {
    _needsRepaintAxis = true;
  }

  /// Specifies the start angle of axis.
  ///
  /// The axis line begins from [startAngle] to [endAngle].
  ///
  /// The picture below illustrates the direction of the angle from 0 degree to 360 degree.
  ///
  /// ![The radial gauge direction of the angle from 0 degree to
  /// 360 degree.](https://cdn.syncfusion.com/content/images/FTControl/Gauge-Angle.jpg)
  ///
  /// Defaults to 130
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           startAngle: 90,
  ///            )]
  ///        ));
  ///}
  /// ```
  final double startAngle;

  /// Specifies the end angle of axis.
  ///
  /// The axis line begins from [startAngle] to [endAngle].
  ///
  /// The picture below illustrates the direction of the angle from 0 degree to 360 degree.
  ///
  /// ![The radial gauge direction of the angle from 0 degree to
  /// 360 degree.](https://cdn.syncfusion.com/content/images/FTControl/Gauge-Angle.jpg)
  ///
  /// Defaults to 50
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           endAngle: 90,
  ///            )]
  ///        ));
  ///}
  /// ```
  final double endAngle;

  /// The size of the axis, expressed as the radius (half the diameter) in factor.
  ///
  /// The [radiusFactor] must be between 0 and 1. Axis radius is determined by multiplying this factor
  /// value to the minimum width or height of the widget.
  ///
  /// Defaults to 0.95
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           radiusFactor: 0.8,
  ///            )]
  ///        ));
  ///}
  /// ```
  final double radiusFactor;

  /// Left location of center axis.
  ///
  /// The [centerX] value must be between 0 to 1. Change the left position of the axis inside the boundary of the widget.
  ///
  /// Defaults to 0.5
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           centerX: 0.2,
  ///            )]
  ///        ));
  ///}
  /// ```
  final double centerX;

  /// Top location of center axis.
  ///
  /// The [centerY] value must be between 0 to 1. Change the top position of the axis inside the boundary of the widget.
  ///
  /// Defaults to 0.5
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           centerY: 0.2,
  ///            )]
  ///        ));
  ///}
  /// ```
  final double centerY;

  /// Whether to show the first label of the axis.
  ///
  /// When [startAngle] and [endAngle] are the same, the first and last labels are intersected.
  /// To prevent this, enable this property to be false, if [showLastLabel] is true.
  ///
  /// Defaults to true
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           showFirstLabel: false,
  ///            )]
  ///        ));
  ///}
  /// ```
  final bool showFirstLabel;

  /// Whether to show the last label of the axis.
  ///
  /// When [startAngle] and [endAngle] are the same, the first and last labels are intersected.
  /// To prevent this, enable this property to be false, if [showFirstLabel] is true.
  ///
  /// Defaults to true
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           showLastLabel: false,
  ///            )]
  ///        ));
  ///}
  /// ```
  final bool showLastLabel;

  /// The callback that is called when an axis label is created.
  ///
  /// The [RadialAxis] passes the [AxisLabelCreatedArgs] to the callback is used to change text value and rotate the
  /// text based on angle.
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           labelCreated: _axisLabelCreated,
  ///            )]
  ///        ));
  ///}
  ///
  ///   void _axisLabelCreated(AxisLabelCreatedArgs args){
  //    if(args.text == '100'){
  //      args.text = 'Completed';
  //      args.canRotate = true;
  //    }
  //  }
  /// ```
  final ValueChanged<AxisLabelCreatedArgs> onLabelCreated;

  /// The callback that is called when an when an axis is tapped.
  ///
  /// The [RadialAxis] passes the tapped axis value to the callback.
  /// ``` dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           axisTapped: _axisTapped,
  ///            )]
  ///        ));
  ///}
  ///
  ///  void _axisTapped(double value){
  //    final double value = value;
  //  }
  /// ```
  final ValueChanged<double> onAxisTapped;

  /// whether to rotate the labels based on angle.
  ///
  /// Defaults to false
  /// ```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           needsRotateLabels: true,
  ///            )]
  ///        ));
  ///}
  /// ```
  final bool needsRotateLabels;

  /// The background image of the [RadialAxis]. Changing the image will set the background to the new image.
  ///
  /// The [backgroundImage] applied for the [RadialAxis] boundary.
  ///
  /// This property is a type of [ImageProvider]. Therefore, you can set the following types of image on this.
  ///
  /// * [AssetImage]
  /// * [NetworkImage]
  /// * [FileImage]
  /// * [MemoryImage]
  ///
  /// Defaults to null.
  ///
  ///```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           backgroundImage: AssetImage('images/dark_background.png')
  ///            )]
  ///        ));
  ///}
  ///```
  final ImageProvider backgroundImage;

  /// Adjust the half or quarter gauge to fit the axis boundary.
  ///
  /// if [canScaleToFit] true, the center and radius position of the axis will be modified on the basis of the angle value.
  ///
  /// Defaults to false
  ///```dart
  /// Widget build(BuildContext context) {
  ///    return Container(
  ///        child: SfRadialGauge(
  ///          axes:<RadialAxis>[RadialAxis(
  ///           canScaleToFit : true
  ///            )]
  ///        ));
  ///}
  ///```
  final bool canScaleToFit;

  ///Specifies the axis rect
  Rect _axisRect;

  /// Specifies the start radian value
  double _startRadian;

  /// Specifies the end radian value
  double _endRadian;

  ///Specifies the radius value
  double _radius;

  ///Specifies the axis center
  double _center;

  ///Specifies the center X value of axis
  double _centerX;

  ///Specifies the center Y value od axis
  double _centerY;

  /// Specifies the actual axis width
  double _actualAxisWidth;

  ///Specifies the radial gauge
  SfRadialGauge _gauge;

  /// Specifies the list of axis labels
  List<CircularAxisLabel> _axisLabels;

  /// Specifies the offset value of major ticks
  List<_TickOffset> _majorTickOffsets;

  /// Specifies the offset value of minor ticks
  List<_TickOffset> _minorTickOffsets;

  /// Specifies the major tick count
  num _majorTicksCount;

  ///Holds the sweep angle of the axis
  double _sweepAngle;

  /// Holds the size of the axis
  Size _axisSize;

  /// Holds the length of major tick based on coordinate unit
  double _actualMajorTickLength;

  /// Holds the length of minor tick based on coordinate unit
  double _actualMinorTickLength;

  /// Specifies the maximum label size
  Size _maximumLabelSize;

  /// Specifies whether the ticks are placed outside
  bool _isTicksOutside;

  /// Specifies whether the labels are placed outside
  bool _isLabelsOutside;

  /// Specifies the maximum length of tick by comparing major and minor tick
  double _maximumTickLength;

  /// Specifies whether to repaint the axis;
  bool _needsRepaintAxis;

  /// Specifies the axis path
  Path _axisPath;

  /// Specifies the axis feature offset value
  double _axisFeatureOffset;

  /// Specifies the axis offset
  double _axisOffset;

  /// Specifies the start corner radian
  double _startCornerRadian;

  /// Specifies the sweep corner radian
  double _sweepCornerRadian;

  /// Specifies the actual label offset
  double _actualLabelOffset;

  /// Specifies the actual tick offset
  double _actualTickOffset;

  /// Specifies the corner angle
  double _cornerAngle;

  /// Specifies whether to include axis elements when calculating the radius
  final bool _useAxisElementsInsideRadius = true;

  /// Specifies the build context
  BuildContext _context;

  /// Specifies the listener
  ImageStreamListener _listener;

  /// Specifies the background image info;
  ImageInfo _backgroundImageInfo;

  /// Specifies the image stream
  ImageStream _imageStream;

  /// Specifies the difference in the radius
  double _diffInRadius;

  /// Specifies the center point of the axis
  Offset _axisCenter;

  /// To calculate the radius and the center point based on the angle
  Offset _calculateBounds() {
    final Offset _centerOffset = _getCenter();
    final double _minScale = math.min(_axisSize.height, _axisSize.width);
    final double _x = ((_centerOffset.dx * 2) - _minScale) / 2;
    final double _y = ((_centerOffset.dy * 2) - _minScale) / 2;
    Rect _bounds = Rect.fromLTRB(_x, _y, _minScale, _minScale);
    final double _centerYDiff = (_axisSize.height / 2 - _centerOffset.dy).abs();
    final double _centerXDiff = (_axisSize.width / 2 - _centerOffset.dx).abs();
    double _diff = 0;
    if (_axisSize.width > _axisSize.height) {
      _diff = _centerYDiff / 2;
      final double _angleRadius = _axisSize.height / 2 + _diff;
      if (_axisSize.width / 2 < _angleRadius) {
        final double _actualDiff = _axisSize.width / 2 - _axisSize.height / 2;
        _diff = _actualDiff * 0.7;
      }

      _bounds = Rect.fromLTRB(_x - _diff / 2, _y, _x + _minScale + (_diff / 2),
          _y + _minScale + _diff);
    } else {
      _diff = _centerXDiff / 2;
      final double _angleRadius = _axisSize.width / 2 + _diff;

      if (_axisSize.height / 2 < _angleRadius) {
        final double _actualDiff = _axisSize.height / 2 - _axisSize.width / 2;
        _diff = _actualDiff * 0.7;
      }

      _bounds = Rect.fromLTRB(_x - _diff / 2, _y - _diff / 2,
          _x + _minScale + (_diff / 2), _y + _minScale + (_diff / 2));
    }

    _diffInRadius = _diff;

    return Offset(
        _bounds.left + (_bounds.width / 2), _bounds.top + (_bounds.height / 2));
  }

  /// Calculates the default values of the axis
  void _calculateDefaultValues() {
    _startRadian = _degreeToRadian(startAngle);
    _sweepAngle = _calculateSweepAngle();
    _endRadian = _degreeToRadian(_sweepAngle);
    _center = math.min(_axisSize.width / 2, _axisSize.height / 2);

    if (!canScaleToFit) {
      _radius = _center * radiusFactor;
      _centerX = (_axisSize.width / 2) - (centerX * _axisSize.width);
      _centerY = (_axisSize.height / 2) - (centerY * _axisSize.height);
      _axisCenter = Offset(
          _axisSize.width / 2 - _centerX, _axisSize.height / 2 - _centerY);
    } else {
      final Offset _centerPoint = _calculateBounds();
      _centerX = _centerPoint.dx;
      _centerY = _centerPoint.dy;
      _radius = (_center + _diffInRadius) * radiusFactor;
      _axisCenter = Offset(_centerX, _centerY);
    }

    _actualAxisWidth = _calculateActualValue(
        axisLineStyle.thickness, axisLineStyle.thicknessUnit, false);
    _actualMajorTickLength = _calculateTickLength(true);
    _actualMinorTickLength = _calculateTickLength(false);
    _maximumTickLength = _actualMajorTickLength > _actualMinorTickLength
        ? _actualMajorTickLength
        : _actualMinorTickLength;
    _actualLabelOffset = _calculateActualValue(labelOffset, offsetUnit, true);
    _actualTickOffset = _calculateActualValue(tickOffset, offsetUnit, true);
    if (backgroundImage != null) {
      _listener = ImageStreamListener(_updateBackgroundImage);
    }
  }

  /// Method to calculate the axis range
  void _calculateAxisRange(BoxConstraints constraints) {
    _axisSize = Size(constraints.maxWidth, constraints.maxHeight);
    _calculateAxisElementsPosition();
    if (pointers != null && pointers.isNotEmpty) {
      _renderPointers();
    }

    if (ranges != null && ranges.isNotEmpty) {
      _renderRanges();
    }

    if (annotations != null && annotations.isNotEmpty) {
      _addGaugeAnnotation();
    }
  }

  /// Method to add the annotation
  void _addGaugeAnnotation() {
    if (annotations.isNotEmpty) {
      for (num i = 0; i < annotations.length; i++) {
        annotations[i]._axis = this;
        annotations[i]._calculatePosition();
      }
    }
  }

  /// Methods to calculate axis elements position
  void _calculateAxisElementsPosition() {
    _isTicksOutside = ticksPosition == ElementsPosition.outside;
    _isLabelsOutside = labelsPosition == ElementsPosition.outside;
    _calculateDefaultValues();
    _axisLabels = generateVisibleLabels();
    _calculateAxisFeatureOffset();
    if (showLabels) {
      _measureAxisLabels();
    }

    _axisOffset = _useAxisElementsInsideRadius ? _calculateAxisOffset() : 0;

    if (showTicks) {
      _calculateMajorTicksPosition();
      _calculateMinorTickPosition();
    }

    if (showLabels) {
      _calculateAxisLabelsPosition();
    }

    _calculateAxisRect();
    if (showAxisLine) {
      _calculateCornerStylePosition();
    }

    if (backgroundImage != null && _backgroundImageInfo?.image == null) {
      _loadBackgroundImage();
    }
  }

  /// To calculate the center based on the angle
  Offset _getCenter() {
    final double _x = _axisSize.width / 2;
    final double _y = _axisSize.height / 2;
    _radius = _center;
    Offset _actualCenter = Offset(_x, _y);
    final double _actualStartAngle = _getWrapAngle(startAngle, -630, 630);
    final double _actualEndAngle =
        _getWrapAngle(startAngle + _sweepAngle.abs(), -630, 630);
    final List<double> _regions = <double>[
      -630,
      -540,
      -450,
      -360,
      -270,
      -180,
      -90,
      0,
      90,
      180,
      270,
      360,
      450,
      540,
      630
    ];
    final List<int> _region = <int>[];
    if (_actualStartAngle < _actualEndAngle) {
      for (int i = 0; i < _regions.length; i++) {
        if (_regions[i] > _actualStartAngle && _regions[i] < _actualEndAngle) {
          _region.add(((_regions[i] % 360) < 0
                  ? (_regions[i] % 360) + 360
                  : (_regions[i] % 360))
              .toInt());
        }
      }
    } else {
      for (int i = 0; i < _regions.length; i++) {
        if (_regions[i] < _actualStartAngle && _regions[i] > _actualEndAngle) {
          _region.add(((_regions[i] % 360) < 0
                  ? (_regions[i] % 360) + 360
                  : (_regions[i] % 360))
              .toInt());
        }
      }
    }

    final double _startRadian = 2 * math.pi * (_actualStartAngle / 360);
    final double _endRadian = 2 * math.pi * (_actualEndAngle / 360);
    final Offset _startPoint = Offset(_x + (_radius * math.cos(_startRadian)),
        _y + (_radius * math.sin(_startRadian)));
    final Offset _endPoint = Offset(_x + (_radius * math.cos(_endRadian)),
        _y + (_radius * math.sin(_endRadian)));

    switch (_region.length) {
      case 0:
        _actualCenter = _calculateCenterForLengthIsZero(
            _startPoint, _endPoint, _x, _y, _radius, _region);
        break;
      case 1:
        _actualCenter = _calculateCenterForLengthIsOne(
            _startPoint, _endPoint, _x, _y, _radius, _region);
        break;
      case 2:
        _actualCenter = _calculateCenterForLengthIsTwo(
            _startPoint, _endPoint, _x, _y, _radius, _region);
        break;
      case 3:
        _actualCenter = _calculateCenterForLengthIsThree(
            _startPoint, _endPoint, _x, _y, _radius, _region);
        break;
    }

    return _actualCenter;
  }

  /// Calculate the center point when the region length is zero
  Offset _calculateCenterForLengthIsZero(Offset _startPoint, Offset _endPoint,
      double _x, double _y, double _radius, List<int> _region) {
    final double _longX =
        (_x - _startPoint.dx).abs() > (_x - _endPoint.dx).abs()
            ? _startPoint.dx
            : _endPoint.dx;
    final double _longY =
        (_y - _startPoint.dy).abs() > (_y - _endPoint.dy).abs()
            ? _startPoint.dy
            : _endPoint.dy;
    final Offset _midPoint =
        Offset((_x + _longX).abs() / 2, (_y + _longY).abs() / 2);
    final double _xValue = _x + (_x - _midPoint.dx);
    final double _yValue = _y + (_y - _midPoint.dy);
    return Offset(_xValue, _yValue);
  }

  ///Calculates the center when the region length is two.
  Offset _calculateCenterForLengthIsOne(Offset _startPoint, Offset _endPoint,
      double _x, double _y, double _radius, List<int> _region) {
    Offset _point1;
    Offset _point2;
    final double _maxRadian = 2 * math.pi * _region[0] / 360;
    final Offset _maxPoint = Offset(_x + (_radius * math.cos(_maxRadian)),
        _y + (_radius * math.sin(_maxRadian)));

    switch (_region[0]) {
      case 270:
        _point1 = Offset(_startPoint.dx, _maxPoint.dy);
        _point2 = Offset(_endPoint.dx, _y);
        break;
      case 0:
      case 360:
        _point1 = Offset(_x, _endPoint.dy);
        _point2 = Offset(_maxPoint.dx, _startPoint.dy);
        break;
      case 90:
        _point1 = Offset(_endPoint.dx, _y);
        _point2 = Offset(_startPoint.dx, _maxPoint.dy);
        break;
      case 180:
        _point1 = Offset(_maxPoint.dx, _startPoint.dy);
        _point2 = Offset(_x, _endPoint.dy);
        break;
    }

    final Offset _midPoint =
        Offset((_point1.dx + _point2.dx) / 2, (_point1.dy + _point2.dy) / 2);
    final double _xValue =
        _x + ((_x - _midPoint.dx) >= _radius ? 0 : (_x - _midPoint.dx));
    final double _yValue =
        _y + ((_y - _midPoint.dy) >= _radius ? 0 : (_y - _midPoint.dy));
    return Offset(_xValue, _yValue);
  }

  ///Calculates the center when the region length is two.
  Offset _calculateCenterForLengthIsTwo(Offset _startPoint, Offset _endPoint,
      double _x, double _y, double _radius, List<int> _region) {
    Offset _point1;
    Offset _point2;
    final double _minRadian = 2 * math.pi * _region[0] / 360;
    final double _maxRadian = 2 * math.pi * _region[1] / 360;
    final Offset _maxPoint = Offset(_x + (_radius * math.cos(_maxRadian)),
        _y + (_radius * math.sin(_maxRadian)));
    final Offset _minPoint = Offset(_x + (_radius * math.cos(_minRadian)),
        _y + (_radius * math.sin(_minRadian)));

    if ((_region[0] == 0 && _region[1] == 90) ||
        (_region[0] == 180 && _region[1] == 270)) {
      _point1 = Offset(_minPoint.dx, _maxPoint.dy);
    } else {
      _point1 = Offset(_maxPoint.dx, _minPoint.dy);
    }

    if (_region[0] == 0 || _region[0] == 180) {
      _point2 = Offset(_getMinMaxValue(_startPoint, _endPoint, _region[0]),
          _getMinMaxValue(_startPoint, _endPoint, _region[1]));
    } else {
      _point2 = Offset(_getMinMaxValue(_startPoint, _endPoint, _region[1]),
          _getMinMaxValue(_startPoint, _endPoint, _region[0]));
    }

    final Offset _midPoint = Offset(
        (_point1.dx - _point2.dx).abs() / 2 >= _radius
            ? 0
            : (_point1.dx + _point2.dx) / 2,
        (_point1.dy - _point2.dy).abs() / 2 >= _radius
            ? 0
            : (_point1.dy + _point2.dy) / 2);
    final double _xValue = _x +
        (_midPoint.dx == 0
            ? 0
            : (_x - _midPoint.dx) >= _radius ? 0 : (_x - _midPoint.dx));
    final double _yValue = _y +
        (_midPoint.dy == 0
            ? 0
            : (_y - _midPoint.dy) >= _radius ? 0 : (_y - _midPoint.dy));
    return Offset(_xValue, _yValue);
  }

  ///Calculates the center when the region length is three.
  Offset _calculateCenterForLengthIsThree(Offset _startPoint, Offset _endPoint,
      double _x, double _y, double _radius, List<int> _region) {
    final double _region0Radian = 2 * math.pi * _region[0] / 360;
    final double _region1Radian = 2 * math.pi * _region[1] / 360;
    final double _region2Radian = 2 * math.pi * _region[2] / 360;
    final Offset _region0Point = Offset(
        _x + (_radius * math.cos(_region0Radian)),
        _y + (_radius * math.sin(_region0Radian)));
    final Offset _region1Point = Offset(
        _x + (_radius * math.cos(_region1Radian)),
        _y + (_radius * math.sin(_region1Radian)));
    final Offset _region2Point = Offset(
        _x + (_radius * math.cos(_region2Radian)),
        _y + (_radius * math.sin(_region2Radian)));
    Offset _regionStartPoint;
    Offset _regionEndPoint;
    switch (_region[2]) {
      case 0:
      case 360:
        _regionStartPoint = Offset(_region0Point.dx, _region1Point.dy);
        _regionEndPoint =
            Offset(_region2Point.dx, math.max(_startPoint.dy, _endPoint.dy));
        break;
      case 90:
        _regionStartPoint =
            Offset(math.min(_startPoint.dx, _endPoint.dx), _region0Point.dy);
        _regionEndPoint = Offset(_region1Point.dx, _region2Point.dy);
        break;
      case 180:
        _regionStartPoint =
            Offset(_region2Point.dx, math.min(_startPoint.dy, _endPoint.dy));
        _regionEndPoint = Offset(_region0Point.dx, _region1Point.dy);
        break;
      case 270:
        _regionStartPoint = Offset(_region1Point.dx, _region2Point.dy);
        _regionEndPoint =
            Offset(math.max(_startPoint.dx, _endPoint.dx), _region0Point.dy);
        break;
    }

    final Offset _midRegionPoint = Offset(
        (_regionStartPoint.dx - _regionEndPoint.dx).abs() / 2 >= _radius
            ? 0
            : (_regionStartPoint.dx + _regionEndPoint.dx) / 2,
        (_regionStartPoint.dy - _regionEndPoint.dy).abs() / 2 >= _radius
            ? 0
            : (_regionStartPoint.dy + _regionEndPoint.dy) / 2);
    final double _xValue = _x +
        (_midRegionPoint.dx == 0
            ? 0
            : (_x - _midRegionPoint.dx) >= _radius
                ? 0
                : (_x - _midRegionPoint.dx));
    final double _yValue = _y +
        (_midRegionPoint.dy == 0
            ? 0
            : (_y - _midRegionPoint.dy) >= _radius
                ? 0
                : (_y - _midRegionPoint.dy));
    return Offset(_xValue, _yValue);
  }

  /// To calculate the value based on the angle
  double _getMinMaxValue(Offset _startPoint, Offset _endPoint, int _degree) {
    final double _minX = math.min(_startPoint.dx, _endPoint.dx);
    final double _minY = math.min(_startPoint.dy, _endPoint.dy);
    final double _maxX = math.max(_startPoint.dx, _endPoint.dx);
    final double _maxY = math.max(_startPoint.dy, _endPoint.dy);
    switch (_degree) {
      case 270:
        return _maxY;
      case 0:
      case 360:
        return _minX;
      case 90:
        return _minY;
      case 180:
        return _maxX;
    }

    return 0;
  }

  /// To calculate the wrap angle
  double _getWrapAngle(double angle, double min, double max) {
    if (max - min == 0) {
      return min;
    }

    angle = ((angle - min) % (max - min)) + min;
    while (angle < min) {
      angle += max - min;
    }

    return angle;
  }

  /// Calculates the rounded corner position
  void _calculateCornerStylePosition() {
    final double _cornerCenter = (_axisRect.right - _axisRect.left) / 2;
    _cornerAngle = _cornerRadiusAngle(_cornerCenter, _actualAxisWidth / 2);

    switch (axisLineStyle.cornerStyle) {
      case CornerStyle.startCurve:
        {
          _startCornerRadian = isInversed
              ? _degreeToRadian(-_cornerAngle)
              : _degreeToRadian(_cornerAngle);
          _sweepCornerRadian = isInversed
              ? _degreeToRadian((-_sweepAngle) + _cornerAngle)
              : _degreeToRadian(_sweepAngle - _cornerAngle);
        }
        break;
      case CornerStyle.endCurve:
        {
          _startCornerRadian = _degreeToRadian(0);
          _sweepCornerRadian = isInversed
              ? _degreeToRadian((-_sweepAngle) + _cornerAngle)
              : _degreeToRadian(_sweepAngle - _cornerAngle);
        }
        break;
      case CornerStyle.bothCurve:
        {
          _startCornerRadian = isInversed
              ? _degreeToRadian(-_cornerAngle)
              : _degreeToRadian(_cornerAngle);
          _sweepCornerRadian = isInversed
              ? _degreeToRadian((-_sweepAngle) + (2 * _cornerAngle))
              : _degreeToRadian(_sweepAngle - (2 * _cornerAngle));
        }
        break;
      case CornerStyle.bothFlat:
        _startCornerRadian = !isInversed
            ? _degreeToRadian(0)
            : _degreeToRadian(startAngle + _sweepAngle);
        final double _value = isInversed ? -1 : 1;
        _sweepCornerRadian = _degreeToRadian(_sweepAngle * _value);
        break;
    }
  }

  /// Calculates the axis rect
  void _calculateAxisRect() {
    _axisOffset =
        _axisOffset > _axisFeatureOffset ? _axisOffset : _axisFeatureOffset;
    _axisRect = Rect.fromLTRB(
        -(_radius - (_actualAxisWidth / 2 + _axisOffset)),
        -(_radius - (_actualAxisWidth / 2 + _axisOffset)),
        _radius - (_actualAxisWidth / 2 + _axisOffset),
        _radius - (_actualAxisWidth / 2 + _axisOffset));
    _axisPath = Path();
    final Rect _rect = Rect.fromLTRB(
      _axisRect.left + _axisSize.width / 2,
      _axisRect.top + _axisSize.height / 2,
      _axisRect.right + _axisSize.width / 2,
      _axisRect.bottom + _axisSize.height / 2,
    );
    _axisPath.arcTo(_rect, _startRadian, _endRadian, false);
  }

  /// Method to calculate the angle from the tapped point
  void _getAngleFromOffset(Offset _offset) {
    final double _centerX = _axisSize.width * centerX;
    final double _centerY = _axisSize.height * centerY;
    double _angle = math.atan2(_offset.dy - _centerY, _offset.dx - _centerX) *
            (180 / math.pi) +
        360;
    final double _endAngle = startAngle + _sweepAngle;
    if (_angle < 360 && _angle > 180) {
      _angle += 360;
    }

    if (_angle > _endAngle) {
      _angle %= 360;
    }

    if (_angle >= startAngle && _angle <= _endAngle) {
      final double _angleFactor = (_angle - startAngle) / _sweepAngle;
      final double _value = factorToValue(_angleFactor);
      if (_value >= minimum && _value <= maximum) {
        final double _tappedValue = _angleToValue(_angle);
        onAxisTapped(_tappedValue);
      }
    }
  }

  /// To calculate the offset based on pointers and range
  double _calculateAxisFeatureOffset() {
    _axisFeatureOffset = 0;
    if (pointers != null && pointers.isNotEmpty) {
      for (num i = 0; i < pointers.length; i++) {
        if (pointers[i] is MarkerPointer) {
          final MarkerPointer _markerPointer = pointers[i];
          if (_markerPointer.markerOffset != null &&
              _markerPointer.markerOffset < 0 &&
              _axisFeatureOffset > _markerPointer.markerOffset) {
            _axisFeatureOffset = _markerPointer.markerOffset;
          }
        } else if (pointers[i] is RangePointer) {
          final RangePointer _rangePointer = pointers[i];
          if (_rangePointer.pointerOffset != null &&
              _rangePointer.pointerOffset < 0 &&
              _axisFeatureOffset > _rangePointer.pointerOffset) {
            _axisFeatureOffset = _rangePointer.pointerOffset;
          }
        }
      }
    }

    if (ranges != null && ranges.isNotEmpty) {
      for (num i = 0; i < ranges.length; i++) {
        if (ranges[i].rangeOffset != null &&
            ranges[i].rangeOffset < 0 &&
            _axisFeatureOffset > ranges[i].rangeOffset) {
          _axisFeatureOffset = ranges[i].rangeOffset;
        }
      }
    }

    _axisFeatureOffset = _axisFeatureOffset.abs();
    return _axisFeatureOffset;
  }

  /// Calculate the offset for axis line based on ticks and labels
  double _calculateAxisOffset() {
    double _offset = 0;
    _offset = _isTicksOutside
        ? showTicks ? (_maximumTickLength + _actualTickOffset) : 0
        : 0;
    _offset += _isLabelsOutside
        ? showLabels
            ? (math.max(_maximumLabelSize.height, _maximumLabelSize.width) / 2 +
                _actualLabelOffset)
            : 0
        : 0;
    return _offset;
  }

  /// Converts the axis value to angle
  double _valueToAngle(double _value) {
    double _angle = 0;
    _value = _minMax(_value, minimum, maximum);
    if (!isInversed) {
      _angle =
          (_sweepAngle / (maximum - minimum).abs()) * (minimum - _value).abs();
    } else {
      _angle = _sweepAngle -
          ((_sweepAngle / (maximum - minimum).abs()) *
              (minimum - _value).abs());
    }

    return _angle;
  }

  /// Converts the angle to corresponding axis value
  double _angleToValue(double _angle) {
    double _value = 0;
    if (!isInversed) {
      _value = (_angle -
              startAngle +
              ((_sweepAngle / (maximum - minimum)) * minimum)) *
          ((maximum - minimum) / _sweepAngle);
    } else {
      _value = -(_angle -
              startAngle -
              _sweepAngle +
              ((_sweepAngle / (maximum - minimum)) * minimum.abs())) *
          ((maximum - minimum) / _sweepAngle);
    }

    return _value;
  }

  /// Calculates the major ticks position
  void _calculateMajorTicksPosition() {
    if (_axisLabels != null && _axisLabels.isNotEmpty) {
      _majorTicksCount = _axisLabels.length;
      final double _angularSpaceForTicks =
          _degreeToRadian(_sweepAngle / (_majorTicksCount - 1));
      double _angleForTicks = 0;
      final double _axisLineWidth = showAxisLine ? _actualAxisWidth : 0;
      double _tickStartOffset = 0;
      double _tickEndOffset = 0;
      _majorTickOffsets = <_TickOffset>[];
      _angleForTicks = _degreeToRadian(startAngle - 90);
      final double _offset = _isLabelsOutside
          ? showLabels
              ? (math.max(_maximumLabelSize.height, _maximumLabelSize.width) /
                      2 +
                  _actualLabelOffset)
              : 0
          : 0;
      if (!_isTicksOutside) {
        _tickStartOffset = _radius -
            (_axisLineWidth + _actualTickOffset + _offset + _axisFeatureOffset);
        _tickEndOffset = _radius -
            (_axisLineWidth +
                _actualMajorTickLength +
                _actualTickOffset +
                _offset +
                _axisFeatureOffset);
      } else {
        final bool _isGreater = _actualMajorTickLength > _actualMinorTickLength;

        // Calculates the major tick position based on the tick length
        // and another features offset value
        if (!_useAxisElementsInsideRadius) {
          _tickStartOffset = _radius + _actualTickOffset - _axisFeatureOffset;
          _tickEndOffset = _radius +
              _actualMajorTickLength +
              _actualTickOffset -
              _axisFeatureOffset;
        } else {
          if (_axisOffset < _axisFeatureOffset) {
            final double _diff = _axisFeatureOffset - _axisOffset;
            _tickEndOffset = _radius - (_diff + _offset + _maximumTickLength);

            _tickStartOffset = _isGreater
                ? _radius - (_diff + _offset)
                : _radius -
                    (_maximumTickLength - _actualMajorTickLength) -
                    (_diff + _offset);
          } else {
            _tickStartOffset = _isGreater
                ? _radius - _offset
                : _radius -
                    (_maximumTickLength - _actualMajorTickLength + _offset);
            _tickEndOffset = _radius - (_offset + _maximumTickLength);
          }
        }
      }

      _calculateOffsetForMajorTicks(_tickStartOffset, _tickEndOffset,
          _angularSpaceForTicks, _angleForTicks);
    }
  }

  /// Calculates the offset for major ticks
  void _calculateOffsetForMajorTicks(
      double _tickStartOffset,
      double _tickEndOffset,
      double _angularSpaceForTicks,
      double _angleForTicks) {
    for (num i = 0; i < _majorTicksCount; i++) {
      double _tickAngle = 0;

      // Adjusts the tick angle for the first and last tick
      if (i == 0 || i == _majorTicksCount - 1) {
        _tickAngle =
            _adjustTickPositionInCorner(i, _angleForTicks, _tickStartOffset);
      } else {
        _tickAngle = _angleForTicks;
      }
      final List<Offset> _tickPosition =
          _getTickPosition(_tickStartOffset, _tickEndOffset, _tickAngle);
      final _TickOffset _tickOffset = _TickOffset();
      _tickOffset.startPoint = _tickPosition[0];
      _tickOffset.endPoint = _tickPosition[1];
      _tickOffset.value = factorToValue(
          (_radianToDegree(_tickAngle) + 90 - startAngle) / _sweepAngle);
      final Offset _centerPoint =
          !canScaleToFit ? Offset(_centerX, _centerY) : const Offset(0, 0);
      _tickOffset.startPoint = Offset(
          _tickOffset.startPoint.dx - _centerPoint.dx,
          _tickOffset.startPoint.dy - _centerPoint.dy);
      _tickOffset.endPoint = Offset(_tickOffset.endPoint.dx - _centerPoint.dx,
          _tickOffset.endPoint.dy - _centerPoint.dy);
      _majorTickOffsets.add(_tickOffset);
      _angleForTicks += _angularSpaceForTicks;
    }

    _majorTickOffsets =
        isInversed ? _majorTickOffsets.reversed.toList() : _majorTickOffsets;
  }

  /// Returns the corresponding range color for the value
  Color _getRangeColor(double _value) {
    Color _color;
    if (ranges != null && ranges.isNotEmpty) {
      for (num i = 0; i < ranges.length; i++) {
        if (ranges[i].startValue <= _value && ranges[i].endValue >= _value) {
          _color = ranges[i].color ??
              _gauge._radialGaugeState._gaugeTheme.rangeColor;
          break;
        }
      }
    }
    return _color;
  }

  /// Calculates the angle to adjust the start and end tick
  double _adjustTickPositionInCorner(
      num _num, double _angleForTicks, double _startOffset) {
    final double _angle = _cornerRadiusAngle(
        _startOffset + _actualAxisWidth / 2, majorTickStyle.thickness / 2);
    final double _ticksAngle = _num == 0
        ? _radianToDegree(_angleForTicks) + _angle
        : _radianToDegree(_angleForTicks) - _angle;
    return _degreeToRadian(_ticksAngle);
  }

  /// Calculates the minor tick position
  void _calculateMinorTickPosition() {
    if (_axisLabels != null && _axisLabels.isNotEmpty) {
      final double _axisLineWidth = showAxisLine ? _actualAxisWidth : 0;
      double _tickStartOffset = 0;
      double _tickEndOffset = 0;
      final double _offset = _isLabelsOutside
          ? showLabels
              ? (_actualLabelOffset +
                  math.max(_maximumLabelSize.height, _maximumLabelSize.width) /
                      2)
              : 0
          : 0;
      if (!_isTicksOutside) {
        _tickStartOffset = _radius -
            (_axisLineWidth + _actualTickOffset + _offset + _axisFeatureOffset);
        _tickEndOffset = _radius -
            (_axisLineWidth +
                _actualMinorTickLength +
                _actualTickOffset +
                _offset +
                _axisFeatureOffset);
      } else {
        final bool _isGreater = _actualMinorTickLength > _actualMajorTickLength;
        if (!_useAxisElementsInsideRadius) {
          _tickStartOffset = _radius + _actualTickOffset - _axisFeatureOffset;
          _tickEndOffset = _radius +
              _actualMinorTickLength +
              _actualTickOffset -
              _axisFeatureOffset;
        } else {
          // Calculates the tick offset value based on tick length and other feature offset
          if (_axisOffset < _axisFeatureOffset) {
            final double _diff = _axisFeatureOffset - _axisOffset;
            _tickStartOffset = _isGreater
                ? _radius - (_offset + _diff)
                : _radius -
                    (_maximumTickLength - _actualMinorTickLength) -
                    (_diff + _offset);
            _tickEndOffset = _radius - (_diff + _offset + _maximumTickLength);
          } else {
            _tickStartOffset = _isGreater
                ? _radius - _offset
                : _radius -
                    (_maximumTickLength - _actualMinorTickLength + _offset);
            _tickEndOffset = _radius - (_maximumTickLength + _offset);
          }
        }
      }

      _calculateOffsetForMinorTicks(_tickStartOffset, _tickEndOffset);
    }
  }

  /// Calculates the offset for minor ticks
  void _calculateOffsetForMinorTicks(
      double _tickStartOffset, double _tickEndOffset) {
    _minorTickOffsets = <_TickOffset>[];

    // angle between each tick
    final double _angularSpaceForTicks =
        _degreeToRadian(_sweepAngle / (_majorTicksCount - 1));
    double _angleForTicks = _degreeToRadian(startAngle - 90);
    final double _totalMinorTicks =
        (_majorTicksCount - 1) * minorTicksPerInterval;
    const num _minorTickIndex =
        1; // Since the minor tick rendering needs to be start in the index one
    final double _minorTickAngle =
        _angularSpaceForTicks / (minorTicksPerInterval + 1);

    for (num i = _minorTickIndex; i <= _totalMinorTicks; i++) {
      _angleForTicks += _minorTickAngle;
      final List<Offset> _tickPosition =
          _getTickPosition(_tickStartOffset, _tickEndOffset, _angleForTicks);
      final _TickOffset _tickOffset = _TickOffset();
      _tickOffset.startPoint = _tickPosition[0];
      _tickOffset.endPoint = _tickPosition[1];
      _tickOffset.value = factorToValue(
          (_radianToDegree(_angleForTicks) + 90 - startAngle) / _sweepAngle);
      final Offset _centerPoint =
          !canScaleToFit ? Offset(_centerX, _centerY) : const Offset(0, 0);
      _tickOffset.startPoint = Offset(
          _tickOffset.startPoint.dx - _centerPoint.dx,
          _tickOffset.startPoint.dy - _centerPoint.dy);
      _tickOffset.endPoint = Offset(_tickOffset.endPoint.dx - _centerPoint.dx,
          _tickOffset.endPoint.dy - _centerPoint.dy);
      _minorTickOffsets.add(_tickOffset);
      if (i % minorTicksPerInterval == 0) {
        _angleForTicks += _minorTickAngle;
      }
    }

    _minorTickOffsets =
        isInversed ? _minorTickOffsets.reversed.toList() : _minorTickOffsets;
  }

  /// Calculate the axis label position
  void _calculateAxisLabelsPosition() {
    if (_axisLabels != null && _axisLabels.isNotEmpty) {
      // Calculates the angle between each  axis label
      final double _labelSpaceInAngle = _sweepAngle / (_axisLabels.length - 1);
      final double _labelSpaceInRadian = _degreeToRadian(_labelSpaceInAngle);

      final double _tickLength = _actualMajorTickLength > _actualMinorTickLength
          ? _actualMajorTickLength
          : _actualMinorTickLength;
      final double _tickPadding =
          showTicks ? _tickLength + _actualTickOffset : 0;
      double _labelRadian = 0;
      double _labelAngle = 0;
      double _labelPosition = 0;
      if (!isInversed) {
        _labelAngle = startAngle - 90;
        _labelRadian = _degreeToRadian(_labelAngle);
      } else {
        _labelAngle = startAngle + _sweepAngle - 90;
        _labelRadian = _degreeToRadian(_labelAngle);
      }

      final double _labelSize =
          math.max(_maximumLabelSize.height, _maximumLabelSize.width) / 2;
      if (_isLabelsOutside) {
        final double _featureOffset = _axisOffset > _axisFeatureOffset
            ? _labelSize
            : (_axisFeatureOffset - _axisOffset) + _labelSize;
        _labelPosition = _useAxisElementsInsideRadius
            ? _radius - _featureOffset
            : _radius + _tickPadding + _actualLabelOffset - _axisFeatureOffset;
      } else {
        _labelPosition = _radius -
            (_actualAxisWidth +
                _tickPadding +
                _actualLabelOffset +
                _axisFeatureOffset);
      }

      for (num i = 0; i < _axisLabels.length; i++) {
        final CircularAxisLabel label = _axisLabels[i];
        label.angle = _labelAngle;
        label.value =
            factorToValue((_labelAngle + 90 - startAngle) / _sweepAngle);
        if (!canScaleToFit) {
          final double x = ((_axisSize.width / 2) -
                  (_labelPosition * math.sin(_labelRadian))) -
              _centerX;
          final double y = ((_axisSize.height / 2) +
                  (_labelPosition * math.cos(_labelRadian))) -
              _centerY;
          label.position = Offset(x, y);
        } else {
          final double x =
              _axisCenter.dx - (_labelPosition * math.sin(_labelRadian));
          final double y =
              _axisCenter.dy + (_labelPosition * math.cos(_labelRadian));
          label.position = Offset(x, y);
        }

        if (!isInversed) {
          _labelRadian += _labelSpaceInRadian;
          _labelAngle += _labelSpaceInAngle;
        } else {
          _labelRadian -= _labelSpaceInRadian;
          _labelAngle -= _labelSpaceInAngle;
        }
      }
    }
  }

  /// To find the maximum label size
  void _measureAxisLabels() {
    _maximumLabelSize = const Size(0, 0);
    for (num i = 0; i < _axisLabels.length; i++) {
      final CircularAxisLabel label = _axisLabels[i];
      label.labelSize = _measureText(label.text, label.labelStyle);
      final double maxWidth = _maximumLabelSize.width < label.labelSize.width
          ? label._needsRotateLabel
              ? label.labelSize.height
              : label.labelSize.width
          : _maximumLabelSize.width;
      final double maxHeight = _maximumLabelSize.height < label.labelSize.height
          ? label.labelSize.height
          : _maximumLabelSize.height;

      _maximumLabelSize = Size(maxWidth, maxHeight);
    }
  }

  /// Gets the start and end offset of tick
  List<Offset> _getTickPosition(
      double _tickStartOffset, double _tickEndOffset, double _angleForTicks) {
    final Offset _centerPoint = !canScaleToFit
        ? Offset(_axisSize.width / 2, _axisSize.height / 2)
        : _axisCenter;
    final double tickStartX =
        _centerPoint.dx - _tickStartOffset * math.sin(_angleForTicks);
    final double tickStartY =
        _centerPoint.dy + _tickStartOffset * math.cos(_angleForTicks);
    final double tickStopX =
        _centerPoint.dx + (1 - _tickEndOffset) * math.sin(_angleForTicks);
    final double tickStopY =
        _centerPoint.dy - (1 - _tickEndOffset) * math.cos(_angleForTicks);
    final Offset startOffset = Offset(tickStartX, tickStartY);
    final Offset endOffset = Offset(tickStopX, tickStopY);
    return <Offset>[startOffset, endOffset];
  }

  ///Method to calculate teh sweep angle of axis
  double _calculateSweepAngle() {
    final double _actualEndAngle = endAngle > 360 ? endAngle % 360 : endAngle;
    double totalAngle = _actualEndAngle - startAngle;
    totalAngle = totalAngle <= 0 ? (totalAngle + 360) : totalAngle;
    return totalAngle;
  }

  ///Calculates the axis width based on the coordinate unit
  double _calculateActualValue(
      double value, GaugeSizeUnit _sizeUnit, bool isOffset) {
    double _actualValue = 0;
    if (value != null) {
      switch (_sizeUnit) {
        case GaugeSizeUnit.factor:
          {
            if (!isOffset) {
              value = value < 0 ? 0 : value;
              value = value > 1 ? 1 : value;
            }

            _actualValue = value * _radius;
          }
          break;
        case GaugeSizeUnit.logicalPixel:
          {
            _actualValue = value;
          }
          break;
      }
    }

    return _actualValue;
  }

  ///Calculates the maximum tick length
  double _calculateTickLength(bool isMajorTick) {
    if (isMajorTick) {
      return _calculateActualValue(
          majorTickStyle.length, majorTickStyle.lengthUnit, false);
    } else {
      return _calculateActualValue(
          minorTickStyle.length, minorTickStyle.lengthUnit, false);
    }
  }

  /// Renders the axis pointers
  void _renderPointers() {
    for (num i = 0; i < pointers.length; i++) {
      final GaugePointer _pointer = pointers[i];
      _pointer._axis = this;
      _pointer._calculatePosition();
    }
  }

  /// Method to render the range
  void _renderRanges() {
    for (num i = 0; i < ranges.length; i++) {
      ranges[i]._axis = this;
      ranges[i]._calculateRangePosition();
    }
  }

  /// Calculates the visible labels based on axis interval and range
  @override
  List<CircularAxisLabel> generateVisibleLabels() {
    final List<CircularAxisLabel> _visibleLabels = <CircularAxisLabel>[];
    final num _actualInterval = calculateNiceInterval();
    for (num i = minimum; i <= maximum; i += _actualInterval) {
      num _value = i;
      String _labelText = _value.toString();
      final List<dynamic> list = _labelText.split('.');
      _value = double.parse(_value.toStringAsFixed(3));

      // Removed the fraction digits in the axis label value
      if (list != null &&
          list.length > 1 &&
          (list[1] == '0' || list[1] == '00' || list[1] == '000'))
        _value = _value.round();
      _labelText = _value.toString();

      if (numberFormat != null) {
        _labelText = numberFormat.format(_value);
      }
      if (labelFormat != null) {
        _labelText = labelFormat.replaceAll(RegExp('{value}'), _labelText);
      }
      AxisLabelCreatedArgs labelCreatedArgs;
      GaugeTextStyle _argsLabelStyle;
      if (onLabelCreated != null) {
        labelCreatedArgs = AxisLabelCreatedArgs();
        labelCreatedArgs.text = _labelText;
        onLabelCreated(labelCreatedArgs);

        _labelText = labelCreatedArgs.text;
        _argsLabelStyle = labelCreatedArgs.labelStyle;
      }

      final GaugeTextStyle _labelStyle = _argsLabelStyle ?? axisLabelStyle;
      final CircularAxisLabel label = CircularAxisLabel(
          _labelStyle,
          _labelText,
          i,
          labelCreatedArgs != null
              ? labelCreatedArgs.canRotate != null
                  ? labelCreatedArgs.canRotate
                  : false
              : false);
      label.value = _value;
      _visibleLabels.add(label);
    }

    return _visibleLabels;
  }

  /// Calculates the interval of axis based on its range
  num calculateNiceInterval() {
    if (interval != null) {
      return interval;
    }

    return _calculateAxisInterval(maximumLabels);
  }

  /// To calculate the axis label based on the maximum axis label
  num _calculateAxisInterval(int _actualMaximumValue) {
    final num _delta = calculateRange();
    final num _circumference = 2 * math.pi * _center * (_sweepAngle / 360);
    final num _desiredIntervalCount =
        math.max(_circumference * ((0.533 * _actualMaximumValue) / 100), 1);
    num _niceInterval = _delta / _desiredIntervalCount;
    final num _minimumInterval =
        math.pow(10, (math.log(_niceInterval) / math.log(10)).floor());
    final dynamic intervalDivisions = <dynamic>[10, 5, 2, 1];
    for (int i = 0; i < intervalDivisions.length; i++) {
      final num _currentInterval = _minimumInterval * intervalDivisions[i];
      if (_desiredIntervalCount < (_delta / _currentInterval)) {
        break;
      }
      _niceInterval = _currentInterval;
    }

    return _niceInterval; // Returns the interval based on the maximum number
    // of labels for 100 labels
  }

  /// To load the image from the image provider
  void _loadBackgroundImage() {
    final ImageStream newImageStream =
        backgroundImage.resolve(createLocalImageConfiguration(_context));
    if (newImageStream.key != _imageStream?.key) {
      _imageStream?.removeListener(_listener);
      _imageStream = newImageStream;
      _imageStream.addListener(_listener);
    }
  }

  /// Update the background image
  void _updateBackgroundImage(ImageInfo _imageInfo, bool _synchronousCall) {
    if (_imageInfo?.image != null) {
      _backgroundImageInfo = _imageInfo;
      _gauge._radialGaugeState.axisRepaintNotifier.value++;
    }
  }

  /// Returns the axis range based on its minimum and maximum
  @override
  num calculateRange() {
    return maximum - minimum;
  }

  /// Converts the axis value to factor based on angle
  @override
  double valueToFactor(double value) {
    final double _angle = _valueToAngle(value);
    return _angle / _sweepAngle;
  }

  /// Converts the factor value to axis value
  @override
  double factorToValue(double factor) {
    final double _angle = (factor * _sweepAngle) + startAngle;
    return _angleToValue(_angle);
  }
}
