import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum FuelConsumption {kilometersPerLiter, litersPer100km, milesPerUsGallon, milesPerImperialGallon}

extension FuelConsumptionExt on FuelConsumption {
  Converter get toConverter {
    switch (this) {
      case FuelConsumption.kilometersPerLiter: return Converter("Kilometers Per Liter", "km/l");
      case FuelConsumption.litersPer100km: return Converter("Liters Per100km", "l/100km");
      case FuelConsumption.milesPerUsGallon: return Converter("Miles Per Us Gallon", "mpg");
      case FuelConsumption.milesPerImperialGallon: return Converter("Miles Per Imperial Gallon", "mpg");
    }
  }

  static final Map<FuelConsumption, double> to= {
    FuelConsumption.kilometersPerLiter: 1,
    FuelConsumption.litersPer100km: 100,
    FuelConsumption.milesPerUsGallon: 2.35214583, // 1 mpg = 2.35214583 km/l
    FuelConsumption.milesPerImperialGallon: 2.82481053, // 1 mpg = 2.82481053 km/l
  };

  static final Map<FuelConsumption, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class FuelConsumptionConverter implements ConverterAb<FuelConsumption> {
  @override
  double convert(double value, FuelConsumption from, FuelConsumption to) {
    var kilometersPerLiter = value * FuelConsumptionExt.to[from]!;
    return kilometersPerLiter * FuelConsumptionExt.from[to]!;
  }
}