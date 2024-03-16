import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Area {
  squareMeters, squareCentimeters, squareInches,
  squareFeet, squareFeetUs, squareMiles,
  squareYard, squareMillimeters, squareKilometers,
  hectares, acres, are,
}

extension AreaExtension on Area {
  Converter get toConverter {
    switch (this) {
      case Area.squareMeters: return Converter("Square Meters", "m²");
      case Area.squareCentimeters: return Converter("Square Centimeters", "cm²");
      case Area.squareInches: return Converter("Square Inches", "in²");
      case Area.squareFeet: return Converter("Square Feet", "ft²");
      case Area.squareMiles: return Converter("Square Miles", "mi²");
      case Area.squareYard: return Converter("Square Yard", "yd²");
      case Area.squareMillimeters: return Converter("Square Millimeters", "mm²");
      case Area.squareKilometers: return Converter("Square Kilometers", "km²");
      case Area.hectares: return Converter("Hectares", "ha");
      case Area.acres: return Converter("Acres", "ac");
      default: return Converter("Are", "a");
    }
  }

  static const Map<Area, double> to = {
    Area.squareMeters: 1.0,
    Area.squareCentimeters: 1e-4,  // 1 square meter = 10000 square centimeters
    Area.squareInches: 0.00064516,  // 1 square meter = 1550.003 square inches (approximately)
    Area.squareFeet: 0.092903,  // 1 square meter = 10.7639 square feet
    Area.squareMiles: 2589988.11,  // 1 square meter = 3.861e-7 square miles
    Area.squareYard: 0.836127,  // 1 square meter = 1.19599 square yards
    Area.squareMillimeters: 1e-6,  // 1 square meter = 1e6 square millimeters
    Area.squareKilometers: 1e6,  // 1 square meter = 1e-6 square kilometers
    Area.hectares: 10000.0,  // 1 square meter = 1e-4 hectares
    Area.acres: 4046.86,  // 1 square meter = 0.000247105 acres
    Area.are: 100.0,  // 1 square meter = 0.01 ares
  };

  static final Map<Area, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class AreaConverter implements ConverterAb<Area> {
  @override
  double convert(double value, Area from, Area to) {
    var squareMeters = value * AreaExtension.to[from]!;
    return squareMeters * AreaExtension.from[to]!;
  }
}