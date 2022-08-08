import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

import 'package:get/get.dart';

class NfcLoadingPageController extends GetxController with StateMixin {
  final RxString _platformVersion = ''.obs;
  final Rx<NFCAvailability> _availability = NFCAvailability.not_supported.obs;
  final Rx<NFCTag?> _tag = Rx(null);
  final RxString _result = "".obs, _writeResult = "".obs;
  final Rx<List<ndef.NDEFRecord>?> _records = Rx(null);

  String get platformVersion => _platformVersion.value;
  NFCAvailability get availability => _availability.value;
  NFCTag? get tag => _tag.value;
  String get result => _result.value;
  String get writeResult => _writeResult.value;
  List<ndef.NDEFRecord>? get records => _records.value;

  set platformVersion(String temp) => _platformVersion.value = temp;
  set availability(NFCAvailability temp) => _availability.value = temp;
  set tag(NFCTag? temp) => _tag.value = temp;
  set result(String temp) => _result.value = temp;
  set writeResult(String temp) => _writeResult.value = temp;
  set records(List<ndef.NDEFRecord>? temp) => _records.value = temp;

  @override
  void onInit() async {
    await initPlatformState();
    super.onInit();
  }

  Future<void> initPlatformState() async {
    NFCAvailability currentAvailablity;
    try {
      currentAvailablity = await FlutterNfcKit.nfcAvailability;
    } on PlatformException {
      currentAvailablity = NFCAvailability.not_supported;
    }
    availability = currentAvailablity;
  }

  Future<void> addExampleNfcRecord() async {
    final example = ndef.TextRecord(
        encoding: ndef.TextEncoding.UTF8, language: "en", text: "hello World");
    records!.add(example);
  }

  Future<void> nfcRead() async {
    try {
      NFCTag tagPolling = await FlutterNfcKit.poll();
      tag = tagPolling;
      await FlutterNfcKit.setIosAlertMessage("Working on it...");
      if (tag!.standard == "ISO 14443-4 (Type B)") {
        String result1 = await FlutterNfcKit.transceive("00B0950000");
        String result2 =
            await FlutterNfcKit.transceive("00A4040009A00000000386980701");
        result = '1: $result1 2: $result2';
      } else if (tag!.type == NFCTagType.iso18092) {
        String result1 = await FlutterNfcKit.transceive("060080080100");
        result = '1: $result1';
      } else if (tag!.type == NFCTagType.mifare_ultralight ||
          tag!.type == NFCTagType.mifare_classic) {
        var ndefRecords = await FlutterNfcKit.readNDEFRecords();
        var ndefString = ndefRecords
            .map((r) => r.toString())
            // ignore: preferinterpolationtocomposestrings
            .reduce((value, element) => "$value\n$element");
        result = '1: $ndefString';
      } else if (tag!.type == NFCTagType.webusb) {
        var r = await FlutterNfcKit.transceive("00A4040006D27600012401");
        log(r);
      }
    } catch (e) {
      result = 'error: $e';
    }

    await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
  }

  Future<void> nfcWrite() async {
    //
    if (records!.isNotEmpty) {
      try {
        tag = await FlutterNfcKit.poll();
        if (tag!.type == NFCTagType.mifare_ultralight ||
            tag!.type == NFCTagType.mifare_classic) {
          await FlutterNfcKit.writeNDEFRecords(records!);
          writeResult = 'OK';
        } else {
          writeResult = 'error: NDEF not supported: ${tag!.type}';
        }
      } catch (e, stacktrace) {
        writeResult = 'error: $e';
        log(stacktrace.toString());
      } finally {
        await FlutterNfcKit.finish();
      }
    } else {
      writeResult = 'error: No record';
    }
  }

  String get currentState =>
      'Running on: $platformVersion \n NFC: $availability';
  String get nfcResult => '''ID: ${tag!.id}
      Standard: ${tag!.standard}
      Type: ${tag!.type}
      ATQA: ${tag!.atqa}
      SAK: ${tag!.sak}
      Historical Bytes: ${tag!.historicalBytes}
      Protocol Info: ${tag!.protocolInfo}
      Application Data: ${tag!.applicationData}
      Higher Layer Response: ${tag!.hiLayerResponse}
      Manufacturer: ${tag!.manufacturer}
      System Code: ${tag!.systemCode}
      DSF ID: ${tag!.dsfId}
      NDEF Available: ${tag!.ndefAvailable}
      NDEF Type: ${tag!.ndefType}
      NDEF Writable: ${tag!.ndefWritable}
      NDEF Can Make Read Only: ${tag!.ndefCanMakeReadOnly}
      NDEF Capacity: ${tag!.ndefCapacity}
       Transceive Result: $result
      ''';
}
