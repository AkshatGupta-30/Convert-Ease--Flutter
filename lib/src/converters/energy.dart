import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Energy {
  joules, kilojoules, calories, kilocalories,
  kilowattHours, electronvolts, energyFootPound,
}

extension EnergyExt on Energy {
  Converter get toConverter {
    switch (this) {
      case Energy.joules: return Converter("Joules", "J");
      case Energy.kilojoules: return Converter("Kilojoules", "kJ");
      case Energy.calories: return Converter("Calories", "cal");
      case Energy.kilocalories: return Converter("Kilocalories", "kcal");
      case Energy.kilowattHours: return Converter("Kilowatt Hours", "kWh");
      case Energy.electronvolts: return Converter("Electronvolts", "eV");
      case Energy.energyFootPound: return Converter("Energy Foot Pound", "ft⋅lbf");
    }
  }

  static final Map<Energy, double> to = {
    Energy.joules: 1,
    Energy.kilojoules: 1000,
    Energy.calories: 4.184, // 1 cal = 4.184 J
    Energy.kilocalories: 4184, // 1 kcal = 4184 J
    Energy.kilowattHours: 3600000, // 1 kWh = 3600000 J
    Energy.electronvolts: 1.60218e-19, // 1 eV = 1.60218e-19 J
    Energy.energyFootPound: 1.35582, // 1 ft⋅lbf = 1.35582 J
  };

  static final Map<Energy, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class EnergyConverter  implements ConverterAb<Energy>{
  @override
  double convert(double value, Energy from, Energy to) {
    var joules = value * EnergyExt.to[from]!;
    return joules * EnergyExt.from[to]!;
  }
}