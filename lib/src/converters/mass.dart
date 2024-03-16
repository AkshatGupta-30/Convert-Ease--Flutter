import 'package:convert_ease/src/converters/main_converter.dart';
import 'package:convert_ease/src/model/converter.dart';

enum Mass {
  grams, ettograms, kilograms, pounds, ounces, quintals, tons,
  milligrams, femtograms, picograms, nanograms, micrograms, decigrams,
  carats, centigrams, pennyweights, troyOunces, stones,
}

extension MassExt on Mass {
  Converter get toConverter {
    switch (this) {
      case Mass.grams: return Converter("Grams", "g");
      case Mass.ettograms: return Converter("Ettograms", "hg");
      case Mass.kilograms: return Converter("Kilograms", "kg");
      case Mass.pounds: return Converter("Pounds", "lb");
      case Mass.ounces: return Converter("Ounces", "oz");
      case Mass.quintals: return Converter("Quintals", "q");
      case Mass.tons: return Converter("Tons", "t");
      case Mass.milligrams: return Converter("Milligrams", "mg");
      case Mass.femtograms: return Converter("Femtograms", "fg");
      case Mass.picograms: return Converter("Picograms", "pg");
      case Mass.nanograms: return Converter("Nanograms", "ng");
      case Mass.micrograms: return Converter("Micrograms", "µg");
      case Mass.decigrams: return Converter("Decigrams", "dg");
      case Mass.carats: return Converter("Carats", "ct");
      case Mass.centigrams: return Converter("Centigrams", "cg");
      case Mass.pennyweights: return Converter("Pennyweights", "dwt");
      case Mass.troyOunces: return Converter("Troy Ounces", "oz t");
      case Mass.stones: return Converter("Stones", "st.");
    }
  }

  static final Map<Mass, double> to = {
    Mass.grams: 1,
    Mass.ettograms: 100,
    Mass.kilograms: 1000,
    Mass.pounds: 453.592,
    Mass.ounces: 28.3495,
    Mass.quintals: 100000,
    Mass.tons: 1000000,
    Mass.milligrams: 0.001,
    Mass.femtograms: 1e-15,
    Mass.picograms: 1e-12,
    Mass.nanograms: 1e-9,
    Mass.micrograms: 1e-6,
    Mass.decigrams: 0.1,
    Mass.carats: 0.2,
    Mass.centigrams: 0.01,
    Mass.pennyweights: 1.55517,
    Mass.troyOunces: 31.1035,
    Mass.stones: 6350.29,
  };

  static final Map<Mass, double> from = to.map((key, value) => MapEntry(key, 1 / value));
}

class MassConverter implements ConverterAb<Mass> {
  @override
  double convert(double value, Mass from, Mass to) {
    var grams = value * MassExt.to[from]!;
    return grams * MassExt.from[to]!;
  }
}