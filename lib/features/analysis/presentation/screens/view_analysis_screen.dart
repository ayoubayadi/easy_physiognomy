import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/analysis_history.dart';

class ViewAnalysisScreen extends StatelessWidget {
  final AnalysisHistory analysis;
  
  const ViewAnalysisScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isArabic = analysis.language == 'ar';
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF9FA8DA).withValues(alpha: 0.2),
                const Color(0xFFF8BBD0).withValues(alpha: 0.15),
                const Color(0xFFB2DFDB).withValues(alpha: 0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF9FA8DA),
                      Color(0xFFB2DFDB),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9FA8DA).withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.history,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      analysis.formattedDate,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${analysis.answeredCount} / ${analysis.totalQuestions} ${l10n.questionsCompleted}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personality Profile Card
                      if (analysis.personalityText.isNotEmpty)
                        _buildPersonalityCard(context, analysis, isArabic),
                      if (analysis.personalityText.isNotEmpty && analysis.upperSectionText.isNotEmpty)
                        const SizedBox(height: 16),
                      // Upper Section
                      if (analysis.upperSectionText.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.psychology_outlined,
                          title: isArabic ? 'القسم العلوي - العقل والإدراك' : 'Upper Section - Mind & Cognition',
                          content: analysis.upperSectionText,
                        ),
                      // Middle Section
                      if (analysis.middleSectionText.isNotEmpty)
                        const SizedBox(height: 16),
                      if (analysis.middleSectionText.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.favorite_outline,
                          title: isArabic ? 'القسم الأوسط - العاطفة والتفاعل' : 'Middle Section - Emotion & Interaction',
                          content: analysis.middleSectionText,
                        ),
                      // Lower Section
                      if (analysis.lowerSectionText.isNotEmpty)
                        const SizedBox(height: 16),
                      if (analysis.lowerSectionText.isNotEmpty)
                        _buildSectionCard(
                          context,
                          icon: Icons.directions_walk_outlined,
                          title: isArabic ? 'القسم السفلي - السلوك والتنفيذ' : 'Lower Section - Behavior & Execution',
                          content: analysis.lowerSectionText,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildPersonalityCard(BuildContext context, AnalysisHistory analysis, bool isArabic) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF9FA8DA),
            Color(0xFFB2DFDB),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9FA8DA).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                isArabic ? 'ملف شخصيتك' : 'Your Personality Profile',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          if (analysis.topTraits.isNotEmpty) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: analysis.topTraits.map((trait) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    trait,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
          if (analysis.personalityText.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              analysis.personalityText,
              style: const TextStyle(
                fontSize: 16,
                height: 1.8,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildSectionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9FA8DA).withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF9FA8DA).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF9FA8DA),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C5C7C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Color(0xFF5C5C7C),
            ),
          ),
        ],
      ),
    );
  }
}
