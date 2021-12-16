import 'package:translator/translator.dart';
import 'package:ansicolor/ansicolor.dart';
import 'dart:io';

AnsiPen pen = AnsiPen()..xterm(061, bg: true);
AnsiPen pen2 = AnsiPen()..xterm(004, bg: true);

void main() async {
  final translator = GoogleTranslator();
  print(pen(
      "Please enter a two letter abbreviation to convert from a language to an other"));
  print("");
  print(pen2("From"));
  print("");
  String? from = stdin.readLineSync();
  print("");
  print(pen2("To"));
  print("");
  String? to = stdin.readLineSync();
  print("");
  print(pen2("Enter the sentence you want to translate to"));
  print("");
  final input = stdin.readLineSync();
  try {
    Translation translatedSentence = await translator
        .translate(input.toString(), from: from.toString(), to: to.toString());
    printWarning("$input to $to\n $translatedSentence");
  } catch (e) {
    printError("You must've entered wrong abbreviation's for the translation");
  }
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printWarning(String text) {
  print('\x1B[32m$text\x1B[0m');
}
