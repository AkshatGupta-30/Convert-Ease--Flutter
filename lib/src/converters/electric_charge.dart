import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum ElectricCharge {
  coulombs, milliCoulombs, microCoulombs, nanoCoulombs, picoCoulombs,
  ampereHours, kiloampereHours, megaampereHours, faraday,
}

extension ElectricChargeExt on ElectricCharge {
  Converter get toConverter {
    switch (this) {
      case ElectricCharge.coulombs: return Converter("Coulombs", "C");
      case ElectricCharge.milliCoulombs: return Converter("Milli Coulombs", "mC");
      case ElectricCharge.microCoulombs: return Converter("Micro Coulombs", "µC");
      case ElectricCharge.nanoCoulombs: return Converter("Nano Coulombs", "nC");
      case ElectricCharge.picoCoulombs: return Converter("Pico Coulombs", "pC");
      case ElectricCharge.ampereHours: return Converter("Ampere Hours", "Ah");
      case ElectricCharge.kiloampereHours: return Converter("Kiloampere Hours", "kAh");
      case ElectricCharge.megaampereHours: return Converter("Megaampere Hours", "MAh");
      case ElectricCharge.faraday: return Converter("Faraday", "faraday");
    }
  }

  static final Map<ElectricCharge, double> to = {
    ElectricCharge.coulombs: 1,
    ElectricCharge.milliCoulombs: 0.001,
    ElectricCharge.microCoulombs: 0.000001,
    ElectricCharge.nanoCoulombs: 0.000000001,
    ElectricCharge.picoCoulombs: 0.000000000001,
    ElectricCharge.ampereHours: 3600, // 1 Ah = 3600 C
    ElectricCharge.kiloampereHours: 3600000, // 1 kAh = 3600000 C
    ElectricCharge.megaampereHours: 3600000000, // 1 MAh = 3600000000 C
    ElectricCharge.faraday: 96485.3399, // 1 faraday = 96485.3399 C
  };

  static final Map<ElectricCharge, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class ElectricChargeConverter implements ConverterAb<ElectricCharge> {
  @override
  double convert(double value, ElectricCharge from, ElectricCharge to) {
    var coulombs = value * ElectricChargeExt.to[from]!;
    return coulombs * ElectricChargeExt.from[to]!;
  }
}