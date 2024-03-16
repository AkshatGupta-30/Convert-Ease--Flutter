import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Illuminance {lux, footCandle,}

extension IlluminanceExt on Illuminance {
  Converter get toConverter {
    switch (this) {
      case Illuminance.lux: return Converter("Lux", "lx");
      case Illuminance.footCandle: return Converter("Foot Candle", "fc");
    }
  }

  static final Map<Illuminance, double> to = {
    Illuminance.lux: 1,
    Illuminance.footCandle: 10.764, // 1 fc ≈ 10.764 lx
  };

  static final Map<Illuminance, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class IlluminanceConverter implements ConverterAb<Illuminance> {
  @override
  double convert(double value, Illuminance from, Illuminance to) {
    var lux = value * IlluminanceExt.to[from]!;
    return lux * IlluminanceExt.from[to]!;
  }
}