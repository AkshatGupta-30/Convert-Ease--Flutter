import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum MolarMass {
  gramsPerMole, gramsPerMillimole, gramsPerMicromole, gramsPerNanomole,
  gramsPerPicomole, gramsPerFemtomole, milligramsPerMole, milligramsPerMillimole,
  milligramsPerMicromole, milligramsPerNanomole, milligramsPerPicomole,
  milligramsPerFemtomole, kilogramsPerMole, kilogramsPerMillimole,
}

extension MolarMassExt on MolarMass {
  Converter get toConverter {
    switch (this) {
      case MolarMass.gramsPerMole: return Converter("Grams Per Mole", "g/mol");
      case MolarMass.gramsPerMillimole: return Converter("Grams Per Millimole", "g/mmol");
      case MolarMass.gramsPerMicromole: return Converter("Grams Per Micromole", "g/µmol");
      case MolarMass.gramsPerNanomole: return Converter("Grams Per Nanomole", "g/nmol");
      case MolarMass.gramsPerPicomole: return Converter("Grams Per Picomole", "g/pmol");
      case MolarMass.gramsPerFemtomole: return Converter("Grams Per Femtomole", "g/fmol");
      case MolarMass.milligramsPerMole: return Converter("Milligrams Per Mole", "mg/mol");
      case MolarMass.milligramsPerMillimole: return Converter("Milligrams Per Millimole", "mg/mmol");
      case MolarMass.milligramsPerMicromole: return Converter("Milligrams Per Micromole", "mg/µmol");
      case MolarMass.milligramsPerNanomole: return Converter("Milligrams Per Nanomole", "mg/nmol");
      case MolarMass.milligramsPerPicomole: return Converter("Milligrams Per Picomole", "mg/pmol");
      case MolarMass.milligramsPerFemtomole: return Converter("Milligrams Per Femtomole", "mg/fmol");
      case MolarMass.kilogramsPerMole: return Converter("Kilograms Per Mole", "kg/mol");
      case MolarMass.kilogramsPerMillimole: return Converter("Kilograms Per Millimole", "kg/mmol");
    }
  }

  static final Map<MolarMass, double> to = {
    MolarMass.gramsPerMole: 1,
    MolarMass.gramsPerMillimole: 0.001,
    MolarMass.gramsPerMicromole: 1e-6,
    MolarMass.gramsPerNanomole: 1e-9,
    MolarMass.gramsPerPicomole: 1e-12,
    MolarMass.gramsPerFemtomole: 1e-15,
    MolarMass.milligramsPerMole: 1000,
    MolarMass.milligramsPerMillimole: 1,
    MolarMass.milligramsPerMicromole: 0.001,
    MolarMass.milligramsPerNanomole: 1e-6,
    MolarMass.milligramsPerPicomole: 1e-9,
    MolarMass.milligramsPerFemtomole: 1e-12,
    MolarMass.kilogramsPerMole: 0.001,
    MolarMass.kilogramsPerMillimole: 1e-6,
  };

  static final Map<MolarMass, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class MolarMassConverter implements ConverterAb<MolarMass> {
  @override
  double convert(double value, MolarMass from, MolarMass to) {
    var gramsPerMole = value * MolarMassExt.to[from]!;
    return gramsPerMole * MolarMassExt.from[to]!;
  }
}