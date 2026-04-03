import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/analysis_history.dart';

class HistoryNotifier extends StateNotifier<List<AnalysisHistory>> {
  static const String _boxName = 'analysis_history';
  Box<AnalysisHistory>? _box;

  HistoryNotifier() : super([]) {
    _initBox();
  }

  Future<void> _initBox() async {
    try {
      print('Initializing history box...');
      _box = await Hive.openBox<AnalysisHistory>(_boxName);
      print('Box opened successfully. Current values: ${_box!.length}');
      await _loadHistory();
    } catch (e, stackTrace) {
      print('Error initializing box: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> _loadHistory() async {
    try {
      if (_box == null) {
        print('Box not initialized, opening now...');
        _box = await Hive.openBox<AnalysisHistory>(_boxName);
      }
      
      print('Loading history from box. Box length: ${_box!.length}');
      print('Box keys: ${_box!.keys.toList()}');
      
      final historyList = _box!.values.toList();
      print('Loaded ${historyList.length} items from box');
      
      historyList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      state = historyList;
      
      print('State updated with ${state.length} items');
    } catch (e, stackTrace) {
      print('Error loading history: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> saveAnalysis(AnalysisHistory analysis) async {
    try {
      if (_box == null) {
        print('Box not initialized, opening now...');
        _box = await Hive.openBox<AnalysisHistory>(_boxName);
      }

      // Check if already exists
      if (_box!.containsKey(analysis.id)) {
        print('Analysis already exists: ${analysis.id}');
        return;
      }

      print('Saving analysis: ${analysis.id}');
      print('Analysis data: totalQuestions=${analysis.totalQuestions}, answeredCount=${analysis.answeredCount}');
      
      await _box!.put(analysis.id, analysis);
      
      print('Analysis saved. Box length: ${_box!.length}');
      
      // Reload to ensure consistency
      await _loadHistory();
    } catch (e, stackTrace) {
      print('Error saving analysis: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> deleteAnalysis(String id) async {
    try {
      if (_box == null) return;
      
      await _box!.delete(id);
      state = state.where((a) => a.id != id).toList();
    } catch (e) {
      print('Error deleting analysis: $e');
    }
  }

  Future<void> clearAllHistory() async {
    try {
      if (_box == null) return;
      
      await _box!.clear();
      state = [];
    } catch (e) {
      print('Error clearing history: $e');
    }
  }
  
  // Debug method to save a test analysis
  Future<void> saveTestAnalysis() async {
    try {
      if (_box == null) {
        _box = await Hive.openBox<AnalysisHistory>(_boxName);
      }
      
      final testAnalysis = AnalysisHistory(
        id: 'test_${DateTime.now().millisecondsSinceEpoch}',
        timestamp: DateTime.now(),
        answers: {'test_question': 0},
        language: 'en',
        totalQuestions: 20,
        answeredCount: 20,
        topTraits: ['Strategic', 'Leader', 'Analytical'],
      );
      
      print('Saving test analysis...');
      await _box!.put(testAnalysis.id, testAnalysis);
      print('Test analysis saved. Box length: ${_box!.length}');
      
      await _loadHistory();
    } catch (e, stackTrace) {
      print('Error saving test analysis: $e');
      print('Stack trace: $stackTrace');
    }
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier, List<AnalysisHistory>>((ref) {
  return HistoryNotifier();
});
