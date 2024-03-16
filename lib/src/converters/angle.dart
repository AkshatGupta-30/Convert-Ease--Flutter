import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Angle {degree, minutes, seconds, radians,}

extension AngleExtension on Angle {
  Converter get toConverter {
    switch (this) {
      case Angle.degree: return Converter("Degree", "deg °");
      case Angle.minutes: return Converter("Minutes", "min '");
      case Angle.seconds: return Converter("Seconds", "sec ''");
      case Angle.radians: return Converter("Radians", "rad");
    }
  }

  static const Map<Angle, double> to = {
    Angle.degree: 360 * 60 * 60,  // 1 degree = 360 * 60 * 60 seconds
    Angle.minutes: 60 * 60,       // 1 minute = 60 * 60 seconds
    Angle.seconds: 60,            // 1 second = 60 seconds
    Angle.radians: 2 * 3.14 * 100, // Hypothetical conversion
  };

  static final Map<Angle, double> from= to.map((key, value) => MapEntry(key, 1 / value));
}

class AngleConverter implements ConverterAb<Angle> {
  @override
  double convert(double value, Angle from, Angle to) {
    var radians = value * AngleExtension.to[from]!;
    return radians * AngleExtension.from[to]!;
  }
}