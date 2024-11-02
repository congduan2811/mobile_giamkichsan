import 'package:flutter/material.dart';
import 'package:mobile_giamkichsan/io/best-hour-io.dart';
import 'package:mobile_giamkichsan/models/best-hour-model.dart';
import 'package:mobile_giamkichsan/models/key-value-model.dart';

class BestHourControllerModel {
  late String descriptionBirthday;
  late List<String> bestHourInDayDescription;
  BestHourControllerModel.newEmpty() {
    descriptionBirthday = "";
    bestHourInDayDescription = [];
  }
}

class BestHourController {
  late BestHourIO _bestHourIO;
  BestHourController() {
    _bestHourIO = BestHourIO();
  }

  Future<BestHourControllerModel> getBestHourInDay(
      String year, String month, String day) async {
    BestHourControllerModel bestHourControllerModel =
        BestHourControllerModel.newEmpty();
    if (year == "" || month == "" || day == "") {
      return bestHourControllerModel;
    }

    var tigerHour = await getTigerHour(int.parse(month));
    if (tigerHour.key == 0) {
      return bestHourControllerModel;
    }
    List<String> hourGiap = [
      "Tý",
      "Sửu",
      "Dần",
      "Mão",
      "Thìn",
      "Tỵ",
      "Ngọ",
      "Mùi",
      "Thân",
      "Dậu",
      "Tuất",
      "Hợi"
    ];
    DateTime dateMonth = DateTime.parse(tigerHour.value);
    int hourTy = dateMonth.hour - 4;
    int minuteTy = dateMonth.minute;
    int cal = int.parse(month) + int.parse(day) - 2;
    for (int hour = 0; hour < 12; hour++) {
      switch ((cal + hour) % 6) {
        case 0:
          bestHourControllerModel.bestHourInDayDescription.add(
              "Tiểu lợi(${hourGiap[hour]}): ${hourTy + hour * 2}: $minuteTy -> ${hourTy + (hour + 1) * 2}: $minuteTy");
          break;
        case 2:
          bestHourControllerModel.bestHourInDayDescription.add(
              "Đại an(${hourGiap[hour]}): ${hourTy + hour * 2}: $minuteTy -> ${hourTy + (hour + 1) * 2}: $minuteTy");
          break;
        case 4:
          bestHourControllerModel.bestHourInDayDescription.add(
              "Tốc hỉ(${hourGiap[hour]}): ${hourTy + hour * 2}: $minuteTy -> ${hourTy + (hour + 1) * 2}: $minuteTy");
          break;
      }
    }
    return bestHourControllerModel;
  }

  Future<BestHourControllerModel> getBestHourBirthday(
      String year, String month, String day, String hourMinute) async {
    BestHourControllerModel bestHourControllerModel =
        BestHourControllerModel.newEmpty();
    if (year == "" || month == "" || day == "" || hourMinute == "") {
      return bestHourControllerModel;
    }

    int hour = int.parse(hourMinute.split(':')[0]);
    int minute = int.parse(hourMinute.split(':')[1]);
    int hourMinuteTiger = 0;
    BestHourModel bestHourModel = BestHourModel.newEmpty();
    var tigerHour = await getTigerHour(int.parse(month));
    if (tigerHour.key == 0) {
      return bestHourControllerModel;
    }
    DateTime dateMonth = DateTime.parse(tigerHour.value);
    hourMinuteTiger = (dateMonth.hour - 4) * 60 + dateMonth.minute;

    var bestHours = await _bestHourIO.getGetAll();
    if (bestHours.length == 0) {
      return bestHourControllerModel;
    }
    for (var bestHour in bestHours) {
      if (hourMinuteTiger + 120 * (bestHour.id - 1) < (hour * 60 + minute)) {
        bestHourModel = bestHour;
      }
    }
    if (hourMinuteTiger + 120 * (bestHourModel.id - 1) + 40 >
        hour * 60 + minute) {
      bestHourControllerModel.descriptionBirthday = bestHourModel.firstHour;
    } else if (hourMinuteTiger + 120 * (bestHourModel.id - 1) + 80 >
        hour * 60 + minute) {
      bestHourControllerModel.descriptionBirthday = bestHourModel.middleHour;
    } else {
      bestHourControllerModel.descriptionBirthday = bestHourModel.finalHour;
    }
    return bestHourControllerModel;
  }

  Future<KeyValueModel> getTigerHour(int month) async {
    var listHour = await _bestHourIO.getBestHourHourTigerOfMonth();
    if (listHour.any((item) => item.key == month)) {
      return listHour.firstWhere((item) => item.key == month);
    } else {
      return KeyValueModel.newEmpty();
    }
  }
}
