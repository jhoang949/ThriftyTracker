import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  double _budget=0;
  double _dining=0;
  double _entertainment=0;
  double _investment=0;
  double _total=0;
  double _totalDining=0;
  double _totalEntertainment=0;
  double _totalInvestment=0;

  // Getters for variables
  double get budget => _budget;
  double get dining => _dining;
  double get entertainment => _entertainment;
  double get investment => _investment;
  double get total => _total;
  double get totalDining => _totalDining;
  double get totalEntertainment => _totalEntertainment;
  double get totalInvestment => _totalInvestment;

  // Setters for variables
  set budget(double value) {
    _budget = value;
    notifyListeners();
  }

  set dining(double value) {
    _dining = value;
    notifyListeners();
  }

  set entertainment(double value) {
    _entertainment = value;
    notifyListeners();
  }

  set investment(double value) {
    _investment = value;
    notifyListeners();
  }

  set total(double value) {
    _total = value;
    notifyListeners();
  }

  set totalDining(double value) {
    _totalDining = value;
    notifyListeners();
  }

  set totalEntertainment(double value) {
    _totalEntertainment = value;
    notifyListeners();
  }

  set totalInvestment(double value) {
    _totalInvestment = value;
    notifyListeners();
  }
}

