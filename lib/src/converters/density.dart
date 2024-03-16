import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Density {
  gramsPerLiter, gramsPerCubicCentimeter, gramsPerMilliliter, gramsPerDeciliter,
  kilogramsPerLiter, kilogramsPerCubicMeter, milligramsPerLiter, milligramsPerDeciliter,
  milligramsPerMilliliter, milligramsPerCubicMeter, milligramsPerCubicCentimeter,
  microgramsPerLiter, microgramsPerDeciliter, microgramsPerMilliliter,
  nanogramsPerLiter, nanogramsPerMilliliter, picogramsPerLiter, picogramsPerMilliliter
}

extension DensityExt on Density {
  Converter get toConverter {
    switch (this) {
      case Density.gramsPerLiter: return Converter("Grams Per Liter", "g/l");
      case Density.gramsPerCubicCentimeter: return Converter("Grams Per Cubic Centimeter", "g/cm³");
      case Density.gramsPerMilliliter: return Converter("Grams Per Milliliter", "g/ml");
      case Density.gramsPerDeciliter: return Converter("Grams Per Deciliter", "g/dl");
      case Density.kilogramsPerLiter: return Converter("Kilograms Per Liter", "kg/l");
      case Density.kilogramsPerCubicMeter: return Converter("Kilograms Per Cubic Meter", "kg/m³");
      case Density.milligramsPerLiter: return Converter("Milligrams Per Liter", "mg/l");
      case Density.milligramsPerDeciliter: return Converter("Milligrams Per Deciliter", "mg/dl");
      case Density.milligramsPerMilliliter: return Converter("Milligrams Per Milliliter", "mg/ml");
      case Density.milligramsPerCubicMeter: return Converter("Milligrams Per Cubic Meter", "mg/m³");
      case Density.milligramsPerCubicCentimeter: return Converter("Milligrams Per Cubic Centimeter", "mg/cm³");
      case Density.microgramsPerLiter: return Converter("Micrograms Per Liter", "µg/l");
      case Density.microgramsPerDeciliter: return Converter("Micrograms Per Deciliter", "µg/dl");
      case Density.microgramsPerMilliliter: return Converter("Micrograms Per Milliliter", "µg/ml");
      case Density.nanogramsPerLiter: return Converter("Nanograms Per Liter", "ng/l");
      case Density.nanogramsPerMilliliter: return Converter("Nanograms Per Milliliter", "ng/ml");
      case Density.picogramsPerLiter: return Converter("Picograms Per Liter", "pg/l");
      case Density.picogramsPerMilliliter: return Converter("Picograms Per Milliliter", "pg/ml");
    }
  }

  static const to = {
    Density.gramsPerLiter: 1.0,
    Density.gramsPerCubicCentimeter: 1000.0,
    Density.gramsPerMilliliter: 1.0,
    Density.gramsPerDeciliter: 0.1,
    Density.kilogramsPerLiter: 1000.0,
    Density.kilogramsPerCubicMeter: 0.001,
    Density.milligramsPerLiter: 0.001,
    Density.milligramsPerDeciliter: 0.0001,
    Density.milligramsPerMilliliter: 1.0,
    Density.milligramsPerCubicMeter: 0.000001,
    Density.milligramsPerCubicCentimeter: 1.0,
    Density.microgramsPerLiter: 0.000001,
    Density.microgramsPerDeciliter: 0.00000001,
    Density.microgramsPerMilliliter: 0.001,
    Density.nanogramsPerLiter: 0.000000001,
    Density.nanogramsPerMilliliter: 0.000001,
    Density.picogramsPerLiter: 0.000000000001,
    Density.picogramsPerMilliliter: 0.000000001,
  };

  static final Map<Density, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class DensityConverter implements ConverterAb<Density> {
  @override
  double convert(double value, Density from, Density to) {
    var gramsPerLiter = value * DensityExt.to[from]!;
    return gramsPerLiter * DensityExt.from[to]!;
  }
}