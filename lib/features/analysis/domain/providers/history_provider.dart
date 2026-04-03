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
      final historyList = box.values.toList();
      historyList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      state = historyList;
    } catch (e) {
      print('Error loading history: $e');
    }
  }
  
  Future<void> saveAnalysis(AnalysisHistory analysis) async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      
      // Check if already exists
      if (box.containsKey(analysis.id)) {
        return; // Already saved
      }
      
      await box.put(analysis.id, analysis);
      
      // Reload to ensure consistency
      final historyList = box.values.toList();
      historyList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      state = historyList;
    } catch (e) {
      print('Error saving analysis: $e');
    }
  }
  
  Future<void> deleteAnalysis(String id) async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      await box.delete(id);
      state = state.where((a) => a.id != id).toList();
    } catch (e) {
      print('Error deleting analysis: $e');
    }
  }
  
  Future<void> clearAllHistory() async {
    try {
      final box = await Hive.openBox<AnalysisHistory>(_boxName);
      await box.clear();
      state = [];
    } catch (e) {
      print('Error clearing history: $e');
    }
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier, List<AnalysisHistory>>((ref) {
  return HistoryNotifier();
});
