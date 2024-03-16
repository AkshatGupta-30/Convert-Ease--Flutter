import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Torque {newtonMeter, dyneMeter, poundForceFeet, kilogramForceMeter, poundalMeter,}

extension TorqueExt on Torque {
  Converter get toConverter {
    switch (this) {
      case Torque.newtonMeter: return Converter("Newton Meter", "N·m");
      case Torque.dyneMeter: return Converter("Dyne Meter", "dyn·m");
      case Torque.poundForceFeet: return Converter("Pound Force Feet", "lbf·ft");
      case Torque.kilogramForceMeter: return Converter("Kilogram Force Meter", "kgf·m");
      case Torque.poundalMeter: return Converter("Poundal Meter", "pdl·m");
    }
  }

  static final Map<Torque, double> to = {
    Torque.newtonMeter: 1,
    Torque.dyneMeter: 0.00001, // 1 newton meter = 10^5 dyne meter
    Torque.poundForceFeet: 1.35582, // 1 newton meter = 1.35582 pound-force feet
    Torque.kilogramForceMeter: 9.80665, // 1 newton meter = 9.80665 kilogram-force meter
    Torque.poundalMeter: 0.0421401, // 1 newton meter = 0.0421401 poundal meter
  };

  static final Map<Torque, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class TorqueConverter implements ConverterAb<Torque> {
  @override
  double convert(double value, Torque from, Torque to) {
    return value * TorqueExt.to[from]! * TorqueExt.from[to]!;
  }
}