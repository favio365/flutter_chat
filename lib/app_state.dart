import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _chatRoomId = prefs.getString('ff_chatRoomId') ?? _chatRoomId;
    _userId = prefs.getString('ff_userId') ?? _userId;
    _favioId = prefs.getString('ff_favioId') ?? _favioId;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _chatRoomId = '1d5532e3-4ee1-4168-b670-51a692c988ce';
  String get chatRoomId => _chatRoomId;
  set chatRoomId(String _value) {
    _chatRoomId = _value;
    prefs.setString('ff_chatRoomId', _value);
  }

  String _userId = 'ec44d048-9dbb-4a7a-b5a7-714c75580b4d';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }

  String _favioId = '334e6bec-5bae-4ec9-bb4d-bef3ad82e887';
  String get favioId => _favioId;
  set favioId(String _value) {
    _favioId = _value;
    prefs.setString('ff_favioId', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
