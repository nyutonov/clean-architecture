import '../../constants/constants.dart';

class LanguageModel {
  final String name;
  final String code;
  final String image;

  LanguageModel({
    required this.name,
    required this.code,
    required this.image,
  });
}

final languages = [
  LanguageModel(
    name: "Русский",
    code: "ru",
    image: PIcons.ru,
  ),
  LanguageModel(
    name: "English",
    code: "en",
    image: PIcons.en,
  ),
  LanguageModel(
    name: "O'zbek",
    code: "uz",
    image: PIcons.uz,
  ),
];
