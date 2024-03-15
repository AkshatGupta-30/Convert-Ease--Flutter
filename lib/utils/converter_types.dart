import 'package:convert_ease/src/model/tab.dart';
import 'package:iconify_flutter_plus/icons/bi.dart';
import 'package:iconify_flutter_plus/icons/carbon.dart';
import 'package:iconify_flutter_plus/icons/charm.dart';
import 'package:iconify_flutter_plus/icons/file_icons.dart';
import 'package:iconify_flutter_plus/icons/healthicons.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:iconify_flutter_plus/icons/iconoir.dart';
import 'package:iconify_flutter_plus/icons/ion.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/octicon.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:iconify_flutter_plus/icons/subway.dart';
import 'package:iconify_flutter_plus/icons/typcn.dart';

enum Converters {
  acceleration, age, angle, area, bmi, date, density, digitalData, discount, electricCharge,
  energy, force, frequency, fuelEfficiency, illuminance, length, mass, molarMass, molarVolume,
  power, pressure, speed, temperature, time, torque, volume
}

extension ConverterExtension on Converters {
  Tabs get tab {
    switch (this) {
      case Converters.acceleration: return Tabs(Ic.twotone_rocket_launch, 'Acceleration');
      case Converters.age: return Tabs(Ic.twotone_cake, 'Age');
      case Converters.angle: return Tabs(Mdi.angle_acute, 'Angle');
      case Converters.area: return Tabs(Ic.twotone_area_chart, 'Area');
      case Converters.bmi: return Tabs(Healthicons.weight_negative, 'BMI');
      case Converters.date: return Tabs(Ic.sharp_calendar_month, 'Date');
      case Converters.density: return Tabs(Carbon.snow_density, 'Density');
      case Converters.digitalData: return Tabs(Charm.binary, 'Digital Data');
      case Converters.discount: return Tabs(Ic.twotone_discount, 'Discount');
      case Converters.electricCharge: return Tabs(Typcn.battery_charge, 'Electric Charge');
      case Converters.energy: return Tabs(Ic.twotone_energy_savings_leaf, 'Energy');
      case Converters.force: return Tabs(Octicon.repo_force_push, 'Force');
      case Converters.frequency: return Tabs(Ph.wave_square_fill, 'Frequency');
      case Converters.fuelEfficiency: return Tabs(Bi.fuel_pump_fill, 'Fuel Efficiency');
      case Converters.illuminance: return Tabs(Iconoir.light_bulb_on, 'Illuminance');
      case Converters.length: return Tabs(Ph.ruler_duotone, 'Length');
      case Converters.mass: return Tabs(Mdi.weight_kilogram, 'Mass');
      case Converters.molarMass: return Tabs(FileIcons.jsx_atom, 'Molar Mass');
      case Converters.molarVolume: return Tabs(FileIcons.moleculer, 'Molar Volume');
      case Converters.power: return Tabs(Subway.power, 'Power');
      case Converters.pressure: return Tabs(Mdi.car_brake_low_pressure, 'Pressure');
      case Converters.speed: return Tabs(Ion.md_speedometer, 'Speed');
      case Converters.temperature: return Tabs(Mdi.thermometer_lines, 'Temperature');
      case Converters.time: return Tabs(MaterialSymbols.nest_clock_farsight_analog_outline, 'Time');
      case Converters.torque: return Tabs(Mdi.engine, 'Torque');
      case Converters.volume: return Tabs(Ion.ios_cube, 'Volume');
      default: return Tabs(Ion.ios_cube, 'Volume');
    }
  }
}
