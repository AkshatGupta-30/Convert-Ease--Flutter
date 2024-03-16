import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Pressure {
  pascal, atmosphere, bar, millibar,
  psi, torr, hectoPascal, inchOfMercury,
}

extension PressureExt on Pressure {
  Converter get toConverter {
    switch (this) {
      case Pressure.pascal: return Converter("Pascal", "Pa");
      case Pressure.atmosphere: return Converter("Atmosphere", "atm");
      case Pressure.bar: return Converter("Bar", "bar");
      case Pressure.millibar: return Converter("Millibar", "mbar");
      case Pressure.psi: return Converter("Psi", "psi");
      case Pressure.torr: return Converter("Torr", "Torr"); // Assuming the same symbol as mmHg
      case Pressure.hectoPascal: return Converter("Hecto Pascal", "hPa");
      case Pressure.inchOfMercury: return Converter("Inch Of Mercury", "inHg");
    }
  }

  static final Map<Pressure, double> to = {
    Pressure.pascal: 1,
    Pressure.atmosphere: 101325, // 1 atmosphere is approximately equal to 101325 pascals
    Pressure.bar: 100000, // 1 bar is equal to 100000 pascals
    Pressure.millibar: 100, // 1 millibar is equal to 100 pascals
    Pressure.psi: 6894.76, // 1 psi is equal to 6894.76 pascals
    Pressure.torr: 133.322, // 1 torr is approximately equal to 133.322 pascals
    Pressure.hectoPascal: 100, // 1 hectopascal is equal to 100 pascals
    Pressure.inchOfMercury: 3386.39, // 1 inch of mercury is equal to 3386.39 pascals
  };

  static final Map<Pressure, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class PressureConverter implements ConverterAb<Pressure> {
  @override
  double convert(double value, Pressure from, Pressure to) {
    var pascals = value * PressureExt.to[from]!;
    return pascals * PressureExt.from[to]!;
  }
}