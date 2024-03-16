import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Power {
  watt, milliwatt, kilowatt, megawatt, gigawatt,
  europeanHorsePower, imperialHorsePower,
}

extension PowerExt on Power {
  Converter get toConverter {
    switch (this) {
      case Power.watt: return Converter("Watt", "W");
      case Power.milliwatt: return Converter("Milliwatt", "mW");
      case Power.kilowatt: return Converter("Kilowatt", "kW");
      case Power.megawatt: return Converter("Megawatt", "MW");
      case Power.gigawatt: return Converter("Gigawatt", "GW");
      case Power.europeanHorsePower: return Converter("European Horse Power", "ehp");
      case Power.imperialHorsePower: return Converter("Imperial Horse Power", "ihp");
    }
  }

  static final Map<Power, double> to = {
    Power.watt: 1,
    Power.milliwatt: 1e-3,
    Power.kilowatt: 1e3,
    Power.megawatt: 1e6,
    Power.gigawatt: 1e9,
    Power.europeanHorsePower: 735.49875, // 1 European Horse Power is approximately 735.49875 watts
    Power.imperialHorsePower: 745.699872, // 1 Imperial Horse Power is approximately 745.699872 watts
  };

  static final Map<Power, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class PowerConverter implements ConverterAb<Power> {
  @override
  double convert(double value, Power from, Power to) {
    var watts = value * PowerExt.to[from]!;
    return watts * PowerExt.from[to]!;
  }
}