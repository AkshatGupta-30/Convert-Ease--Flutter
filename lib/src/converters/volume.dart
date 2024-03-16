import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Volume {
  cubicMeters, liters, imperialGallons, usGallons, imperialPints, usPints,
  milliliters, tablespoonsUs, australianTablespoons, cups, cubicCentimeters,
  cubicFeet, cubicInches, cubicMillimeters, imperialFluidOunces,
  usFluidOunces, imperialGill, usGill, usQuarts, femtoliters,
  picoliters, nanoliters, microliters, deciliters, centiliters,
}

extension VolumeExt on Volume {
  Converter get toConverter {
    switch (this) {
      case Volume.cubicMeters: return Converter("Cubic Meters", "m³");
      case Volume.liters: return Converter("Liters", "L");
      case Volume.imperialGallons: return Converter("Imperial Gallons", "imp gal");
      case Volume.usGallons: return Converter("US Gallons", "US gal");
      case Volume.imperialPints: return Converter("Imperial Pints", "imp pt");
      case Volume.usPints: return Converter("US Pints", "US pt");
      case Volume.milliliters: return Converter("Milliliters", "mL");
      case Volume.tablespoonsUs: return Converter("Tablespoons US", "tbsp (US)");
      case Volume.australianTablespoons: return Converter("Australian Tablespoons", "tbsp (Australian)");
      case Volume.cups: return Converter("Cups", "cups");
      case Volume.cubicCentimeters: return Converter("Cubic Centimeters", "cm³");
      case Volume.cubicFeet: return Converter("Cubic Feet", "ft³");
      case Volume.cubicInches: return Converter("Cubic Inches", "in³");
      case Volume.cubicMillimeters: return Converter("Cubic Millimeters", "mm³");
      case Volume.imperialFluidOunces: return Converter("Imperial Fluid Ounces", "imp fl oz");
      case Volume.usFluidOunces: return Converter("US Fluid Ounces", "US fl oz");
      case Volume.imperialGill: return Converter("Imperial Gill", "imp gill");
      case Volume.usGill: return Converter("US Gill", "US gill");
      case Volume.usQuarts: return Converter("US Quarts", "US qt");
      case Volume.femtoliters: return Converter("Femtoliters", "fL");
      case Volume.picoliters: return Converter("Picoliters", "pL");
      case Volume.nanoliters: return Converter("Nanoliters", "nL");
      case Volume.microliters: return Converter("Microliters", "µL");
      case Volume.deciliters: return Converter("Deciliters", "dL");
      case Volume.centiliters: return Converter("Centiliters", "cL");
    }
  }

  static final Map<Volume, double> to = {
    Volume.liters: 1,
    Volume.milliliters: 0.001,
    Volume.imperialGallons: 4.54609,
    Volume.usGallons: 3.78541,
    Volume.imperialPints: 0.568261,
    Volume.usPints: 0.473176,
    Volume.tablespoonsUs: 0.0147868,
    Volume.australianTablespoons: 0.020,
    Volume.cups: 0.236588,
    Volume.cubicCentimeters: 0.001,
    Volume.cubicFeet: 28.3168,
    Volume.cubicInches: 0.0163871,
    Volume.cubicMillimeters: 0.000001,
    Volume.imperialFluidOunces: 0.0284131,
    Volume.usFluidOunces: 0.0295735,
    Volume.imperialGill: 0.142065,
    Volume.usGill: 0.118294,
    Volume.usQuarts: 0.946353,
    Volume.femtoliters: 0.000000001,
    Volume.picoliters: 0.000000000001,
    Volume.nanoliters: 0.000000001,
    Volume.microliters: 0.000001,
    Volume.deciliters: 0.1,
    Volume.centiliters: 0.01,
  };

  static final Map<Volume, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}


class VolumeConverter implements ConverterAb<Volume> {
  @override
  double convert(double value, Volume from, Volume to) {
    return value * VolumeExt.to[from]! * VolumeExt.from[to]!;
  }
}