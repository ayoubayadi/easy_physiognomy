import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/analysis_history.dart';

class HistoryNotifier extends StateNotifier<List<AnalysisHistory>> {
  static const String _boxName = 'analysis_history';
  
  HistoryNotifier() : super([]) {
    _loadHistory();
  }
  
  Future<void> _loadHistory() async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      state = box.values.toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    } catch (e) {
      // Silent fail
    }
  }
  
  Future<void> saveAnalysis(AnalysisHistory analysis) async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      await box.put(analysis.id, analysis);
      state = [analysis, ...state];
    } catch (e) {
      // Silent fail
    }
  }
  
  Future<void> deleteAnalysis(String id) async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      await box.delete(id);
      state = state.where((a) => a.id != id).toList();
    } catch (e) {
      // Silent fail
    }
  }
  
  Future<void> clearAllHistory() async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      await box.clear();
      state = [];
    } catch (e) {
      // Silent fail
    }
  }
  
  AnalysisHistory? getAnalysis(String id) {
    try {
      return state.firstWhere((a) => a.id == id);
    } catch (e) {
      return null;
    }
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier, List<AnalysisHistory>>((ref) {
  return HistoryNotifier();
});
