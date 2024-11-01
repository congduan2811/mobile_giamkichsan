import 'package:mobile_giamkichsan/io/cung-io.dart';
import 'package:mobile_giamkichsan/io/hoi-io.dart';
import 'package:mobile_giamkichsan/io/tam-cung-dinh-io.dart';
import 'package:mobile_giamkichsan/models/hoi-model.dart';
import 'package:mobile_giamkichsan/models/tam-cung-dinh-model.dart';

class TamCungDinhControllerModel {
  late TamCungDinhModel tamCungDinhModel;
  TamCungDinhControllerModel.newEmpty() {
    tamCungDinhModel = TamCungDinhModel.newEmpty();
  }
}

class TamCungDinhController {
  late HoiIO _hoiIO;
  late TamCungDinhIO _tamCungDinhIO;
  late CungIO _cungIO;
  TamCungDinhController() {
    _hoiIO = HoiIO();
    _tamCungDinhIO = TamCungDinhIO();
    _cungIO = CungIO();
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

  Future<TamCungDinhControllerModel> getByValue(
      bool isHoiNam, String valueNam, bool isHoiNu, String valueNu) async {
    TamCungDinhControllerModel tamCungDinhControllerModel =
        TamCungDinhControllerModel.newEmpty();
    if (valueNam == "" || valueNu == "") {
      return tamCungDinhControllerModel;
    }
    var listHoi = await _hoiIO.getGetAll();
    var listTamCungDinh = await _tamCungDinhIO.getGetAll();
    var listCung = await _cungIO.getGetAll();
    if (listHoi.length == 0 || listTamCungDinh == 0 || listCung == 0) {
      return tamCungDinhControllerModel;
    }

    var hoiNam = HoiModel.newEmpty();
    var hoiNu = HoiModel.newEmpty();
    if (isHoiNam) {
      hoiNam = getHoiByHoi(listHoi, valueNam);
    } else {
      hoiNam = getHoiByDate(listHoi, int.parse(valueNam));
    }
    if (isHoiNu) {
      hoiNu = getHoiByHoi(listHoi, valueNu);
    } else {
      hoiNu = getHoiByDate(listHoi, int.parse(valueNu));
    }

    if (hoiNam!.id! == 0 || hoiNu!.id! == 0) {
      return tamCungDinhControllerModel;
    }

    var cungNam = listCung.firstWhere((item) => item.hoiID == hoiNam.id);
    var cungNu = listCung.firstWhere((item) => item.hoiID == hoiNu.id);
    if (cungNam!.id! == 0 || cungNu!.id! == 0) {
      return tamCungDinhControllerModel;
    }

    if (listTamCungDinh.any((item) =>
        item.cungNam == cungNam.cungNam && item.cungNu == cungNu.cungNu)) {
      tamCungDinhControllerModel.tamCungDinhModel = listTamCungDinh.firstWhere(
          (item) =>
              item.cungNam == cungNam.cungNam && item.cungNu == cungNu.cungNu);
    }
    return tamCungDinhControllerModel;
  }
}
