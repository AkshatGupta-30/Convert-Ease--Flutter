import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Force { newton, dyne, poundForce, kilogramForce, poundal}

extension ForceExt on Force {
  Converter get toConverter {
    switch (this) {
      case Force.newton: return Converter("Newton", "N");
      case Force.dyne: return Converter("Dyne", "dyn");
      case Force.poundForce: return Converter("Pound Force", "lbf");
      case Force.kilogramForce: return Converter("Kilogram Force", "kgf");
      case Force.poundal: return Converter("Poundal", "pdl");
    }
  }

  static final Map<Force, double> to = {
    Force.newton: 1,
    Force.dyne: 0.00001, // 1 dyn = 0.00001 N
    Force.poundForce: 4.44822, // 1 lbf = 4.44822 N
    Force.kilogramForce: 9.80665, // 1 kgf = 9.80665 N
    Force.poundal: 0.138255, // 1 pdl = 0.138255 N
  };

  static final Map<Force, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}


class ForceConverter implements ConverterAb<Force> {
  @override
  double convert(double value, Force from, Force to) {
    var newton = value * ForceExt.to[from]!;
    return newton * ForceExt.from[to]!;
  }
}