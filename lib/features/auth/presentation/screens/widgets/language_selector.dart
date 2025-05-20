import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  final Function(String) onLanguageChanged;
  final String currentLanguage;

  const LanguageSelector({
    super.key,
    required this.onLanguageChanged,
    this.currentLanguage = 'ru',
  });

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  Widget _buildLangButton(String langCode, String label, bool isSelected) {
    return GestureDetector(
      onTap: () => widget.onLanguageChanged(langCode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFAEDFF6) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black87 : Colors.white,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLangButton('oz', 'Ozb', widget.currentLanguage == 'oz'),
        const SizedBox(width: 8),
        _buildLangButton('ru', 'Рус', widget.currentLanguage == 'ru'),
        const SizedBox(width: 8),
        _buildLangButton('en', 'Eng', widget.currentLanguage == 'en'),
      ],
    );
  }
}
