import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Speed {
  metersPerSecond, kilometersPerHour, milesPerHour,
  knots, feetPerSecond, minutesPerKilometer,
}

extension SpeedExt on Speed {
  Converter get toConverter {
    switch (this) {
      case Speed.metersPerSecond: return Converter("Meters Per Second", "m/s");
      case Speed.kilometersPerHour: return Converter("Kilometers Per Hour", "km/h");
      case Speed.milesPerHour: return Converter("Miles Per Hour", "mi/h");
      case Speed.knots: return Converter("Knots", "kts");
      case Speed.feetPerSecond: return Converter("Feet Per Second", "ft/s");
      case Speed.minutesPerKilometer: return Converter("Minutes Per Kilometer", "min/km");
    }
  }

  static final Map<Speed, double> to = {
    Speed.metersPerSecond: 1,
    Speed.kilometersPerHour: 0.277778, // 1 meter per second is equal to approximately 3.6 kilometers per hour
    Speed.milesPerHour: 0.44704, // 1 meter per second is equal to approximately 2.23694 miles per hour
    Speed.knots: 0.514444, // 1 meter per second is equal to approximately 1.94384 knots
    Speed.feetPerSecond: 3.28084, // 1 meter per second is equal to approximately 3.28084 feet per second
    Speed.minutesPerKilometer: 16.6667, // 1 meter per second is equal to approximately 60 minutes per kilometer
  };

  static final Map<Speed, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class SpeedConverter implements ConverterAb<Speed> {
  @override
  double convert(double value, Speed from, Speed to) {
    var metersPerSecond = value * SpeedExt.to[from]!;
    return metersPerSecond * SpeedExt.from[to]!;
  }
}