import 'package:mobile_giamkichsan/io/dien-trach-io.dart';
import 'package:mobile_giamkichsan/io/hoi-io.dart';
import 'package:mobile_giamkichsan/models/dien-trach-model.dart';
import 'package:mobile_giamkichsan/models/hoi-model.dart';
import 'package:mobile_giamkichsan/models/key-value-model.dart';

class ProfilePersonControllerModel {
  late HoiModel hoiModel;
  late DienTrachModel dienTrachModel;
  late List<KeyValueModel> tuoiLamNha;
  late String description;
  ProfilePersonControllerModel.newEmpty() {
    hoiModel = HoiModel.newEmpty();
    dienTrachModel = DienTrachModel.newEmpty();
    tuoiLamNha = [];
    description = "";
  }
}

class ProfilePersonController {
  late HoiIO _hoiIO;
  late DienTrachIO _dienTrachIO;
  ProfilePersonController() {
    _hoiIO = HoiIO();
    _dienTrachIO = DienTrachIO();
  }

  HoiModel getHoiByHoi(List<HoiModel> list, String tenHoi) {
    HoiModel output = HoiModel.newEmpty();
    if (list.any((item) => item.name.toUpperCase() == tenHoi.toUpperCase())) {
      output = list.firstWhere(
          (item) => item.name.toUpperCase() == tenHoi.toUpperCase());
    }
    return output;
  }

  HoiModel getHoiByDate(List<HoiModel> list, int date) {
    HoiModel output = HoiModel.newEmpty();
    int currentYear = date;
    if (list.first.year <= 0 || list.last.year <= 0 || currentYear <= 0) {
      return output;
    }
    while (currentYear < list.first.year) {
      currentYear += 60;
    }
    while (currentYear > list.last.year) {
      currentYear -= 60;
    }
    if (list.any((item) => item.year == currentYear)) {
      output = list.firstWhere((item) => item.year == currentYear);
      output.year = currentYear;
    }
    return output;
  }

  Future<ProfilePersonControllerModel> getByValue(
      bool isHoi, String value) async {
    ProfilePersonControllerModel bestHourControllerModel =
        ProfilePersonControllerModel.newEmpty();
    if (value == "") {
      return bestHourControllerModel;
    }
    var listHoi = await _hoiIO.getGetAll();
    var hoi = HoiModel.newEmpty();
    if (isHoi) {
      hoi = getHoiByHoi(listHoi, value);
    } else {
      hoi = getHoiByDate(listHoi, int.parse(value));
    }
    if (hoi!.id! == 0) {
      return bestHourControllerModel;
    }
    bestHourControllerModel.hoiModel = hoi;

    var listDienTrach = await _dienTrachIO.getGetAll();
    bestHourControllerModel.dienTrachModel = listDienTrach.firstWhere(
        (item) => item.hoiID == bestHourControllerModel.hoiModel.id);
    bestHourControllerModel.description = await _dienTrachIO.getDescription();
    var builds = await _dienTrachIO.getYearsBuildGetAll();
    if (builds.any((item) =>
        item.key ==
        (DateTime.now().year + 1 - bestHourControllerModel.hoiModel.year))) {
      bestHourControllerModel.tuoiLamNha.add(builds.firstWhere((item) =>
          item.key ==
          (DateTime.now().year + 1 - bestHourControllerModel.hoiModel.year)));
    }
    if (isHoi) {
      int firstYear = bestHourControllerModel.hoiModel.year - 60;
      int lastYear = bestHourControllerModel.hoiModel.year + 60;
      if (builds
          .any((item) => item.key == (DateTime.now().year + 1 - firstYear))) {
        bestHourControllerModel.tuoiLamNha.add(builds.firstWhere(
            (item) => item.key == (DateTime.now().year + 1 - firstYear)));
      }
      if (builds
          .any((item) => item.key == (DateTime.now().year + 1 - lastYear))) {
        bestHourControllerModel.tuoiLamNha.add(builds.firstWhere(
            (item) => item.key == (DateTime.now().year + 1 - lastYear)));
      }
    }
    return bestHourControllerModel;
  }
}
