import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Acceleration {
  metersPerSecondSquared, kilometersPerHourSquared, milesPerHourSquared,
  feetPerSecondSquared, gravity, galileo, standardGravity,
}

extension AccelerationExt on Acceleration {
  Converter get toConverter {
    switch (this) {
      case Acceleration.metersPerSecondSquared: return Converter("Meters Per Second Squared", "m/s²");
      case Acceleration.kilometersPerHourSquared: return Converter("Kilometers Per Hour Squared", "km/h²");
      case Acceleration.milesPerHourSquared: return Converter("Miles Per Hour Squared", "mi/h²");
      case Acceleration.feetPerSecondSquared: return Converter("Feet Per Second Squared", "ft/s²");
      case Acceleration.gravity: return Converter("Gravity", "g");
      case Acceleration.galileo: return Converter("Galileo", "Gal");
      case Acceleration.standardGravity: return Converter("Standard Gravity", "standard g");
    }
  }

  static const Map<Acceleration, double> to = {
    Acceleration.metersPerSecondSquared: 1,
    Acceleration.kilometersPerHourSquared: 0.00007716049382716, // 1 km/h² = 0.00007716049382716 m/s²
    Acceleration.milesPerHourSquared: 0.0001245397788422, // 1 mph² = 0.0001245397788422 m/s²
    Acceleration.feetPerSecondSquared: 0.3048, // 1 ft/s² = 0.3048 m/s²
    Acceleration.gravity: 9.80665, // Standard gravity (g)
    Acceleration.galileo: 0.01, // 1 Galileo = 0.01 m/s²
    Acceleration.standardGravity: 9.80665, // Standard gravity (g)
  };

  static final Map<Acceleration, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class AccelerationConverter  implements ConverterAb<Acceleration> {
  @override
  double convert(double value, Acceleration from, Acceleration to) {
    var metersPerSecondSquared = value * AccelerationExt.to[from]!;
    return metersPerSecondSquared * AccelerationExt.from[to]!;
  }
}