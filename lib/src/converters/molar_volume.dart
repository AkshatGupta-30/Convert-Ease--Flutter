import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum MolarVolume {
  molesPerLiter, molesPerMilliliter, molesPerCubicMeter,
  millimolesPerLiter, millimolesPerDeciliter, micromolesPerLiter,
  micromolesPerDeciliter, micromolesPerMilliliter, nanomolesPerLiter,
  nanomolesPerDeciliter, nanomolesPerMilliliter, picomolesPerLiter,
  picomolesPerDeciliter, picomolesPerMilliliter, femtomolesPerMilliliter,
}

extension MolarVolumeExt on MolarVolume {
  Converter get toConverter {
    switch (this) {
      case MolarVolume.molesPerLiter: return Converter("Moles Per Liter", "mol/l");
      case MolarVolume.molesPerMilliliter: return Converter("Moles Per Milliliter", "mol/ml");
      case MolarVolume.molesPerCubicMeter: return Converter("Moles Per Cubic Meter", "mol/m³");
      case MolarVolume.millimolesPerLiter: return Converter("Millimoles Per Liter", "mmol/l");
      case MolarVolume.millimolesPerDeciliter: return Converter("Millimoles Per Deciliter", "mmol/dl");
      case MolarVolume.micromolesPerLiter: return Converter("Micromoles Per Liter", "µmol/l");
      case MolarVolume.micromolesPerDeciliter: return Converter("Micromoles Per Deciliter", "µmol/dl");
      case MolarVolume.micromolesPerMilliliter: return Converter("Micromoles Per Milliliter", "µmol/ml");
      case MolarVolume.nanomolesPerLiter: return Converter("Nanomoles Per Liter", "nmol/l");
      case MolarVolume.nanomolesPerDeciliter: return Converter("Nanomoles Per Deciliter", "nmol/dl");
      case MolarVolume.nanomolesPerMilliliter: return Converter("Nanomoles Per Milliliter", "nl/ml");
      case MolarVolume.picomolesPerLiter: return Converter("Picomoles Per Liter", "pmol/l");
      case MolarVolume.picomolesPerDeciliter: return Converter("Picomoles Per Deciliter", "pmol/dl");
      case MolarVolume.picomolesPerMilliliter: return Converter("Picomoles Per Milliliter", "pmol/ml");
      case MolarVolume.femtomolesPerMilliliter: return Converter("Femtomoles Per Milliliter", "fmol/ml");
    }
  }

  static final Map<MolarVolume, double> to = {
    MolarVolume.molesPerLiter: 1,
    MolarVolume.molesPerMilliliter: 1000,
    MolarVolume.molesPerCubicMeter: 1000,
    MolarVolume.millimolesPerLiter: 1000,
    MolarVolume.millimolesPerDeciliter: 10000,
    MolarVolume.micromolesPerLiter: 1e6,
    MolarVolume.micromolesPerDeciliter: 1e7,
    MolarVolume.micromolesPerMilliliter: 1e6,
    MolarVolume.nanomolesPerLiter: 1e9,
    MolarVolume.nanomolesPerDeciliter: 1e10,
    MolarVolume.nanomolesPerMilliliter: 1e9,
    MolarVolume.picomolesPerLiter: 1e12,
    MolarVolume.picomolesPerDeciliter: 1e13,
    MolarVolume.picomolesPerMilliliter: 1e12,
    MolarVolume.femtomolesPerMilliliter: 1e15,
  };

  static final Map<MolarVolume, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class MolarVolumeConverter implements ConverterAb<MolarVolume> {
  @override
  double convert(double value, MolarVolume from, MolarVolume to) {
    var molesPerLiter = value * MolarVolumeExt.to[from]!;
    return molesPerLiter * MolarVolumeExt.from[to]!;
  }
}