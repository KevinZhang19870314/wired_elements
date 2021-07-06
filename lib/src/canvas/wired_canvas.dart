import 'package:flutter/material.dart';
import '../../rough/rough.dart';

import 'wired_painter_base.dart';
import 'wired_painter.dart';

class WiredCanvas extends StatelessWidget {
  final WiredPainterBase painter;
  final DrawConfig? drawConfig;
  final FillerConfig? fillerConfig;
  final RoughFilter fillerType;
  final Size? size;

  const WiredCanvas({
    Key? key,
    required this.painter,
    required this.fillerType,
    this.drawConfig,
    this.fillerConfig,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrawConfig _drawConfig =
        drawConfig == null ? DrawConfig.defaultValues : drawConfig!;
    FillerConfig _fillerConfig =
        fillerConfig == null ? FillerConfig.defaultConfig : fillerConfig!;

    Filler filler = _filters[fillerType]!.call(_fillerConfig);
    return CustomPaint(
      size: size == null ? const Size.square(double.infinity) : size!,
      painter: WiredPainter(_drawConfig, filler, painter),
    );
  }
}

Map<RoughFilter, Filler Function(FillerConfig)> _filters =
    <RoughFilter, Filler Function(FillerConfig)>{
  RoughFilter.NoFiller: (fillerConfig) => NoFiller(fillerConfig),
  RoughFilter.HachureFiller: (fillerConfig) => HachureFiller(fillerConfig),
  RoughFilter.ZigZagFiller: (fillerConfig) => ZigZagFiller(fillerConfig),
  RoughFilter.HatchFiller: (fillerConfig) => HatchFiller(fillerConfig),
  RoughFilter.DotFiller: (fillerConfig) => DotFiller(fillerConfig),
  RoughFilter.DashedFiller: (fillerConfig) => DashedFiller(fillerConfig),
  RoughFilter.SolidFiller: (fillerConfig) => SolidFiller(fillerConfig),
};

enum RoughFilter {
  NoFiller,
  HachureFiller,
  ZigZagFiller,
  HatchFiller,
  DotFiller,
  DashedFiller,
  SolidFiller,
}
