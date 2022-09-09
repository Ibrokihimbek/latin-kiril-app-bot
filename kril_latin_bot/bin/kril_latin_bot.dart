import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:translit/translit.dart';

void main() async {
  var BOT_TOKEN = '5444398925:AAFayA7A7erNRM448szrwOsijajbLEtkI7M';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));
  teledart.start();

  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
      (message) => teledart.sendMessage(message.chat.id, "So'z kiriting"));

  teledart.onMessage().listen(
      (message) => message.reply(kirilToLatin(message.text.toString()) + ' '));
}

String kirilToLatin(String? word) {
  if (word!.length > 3904) {
    return "Matn cheklangan uzunlikdan o'tib ketti";
  }
  if (word == 'null') {
    return "Noto'g'ri ma'lumot kiritingiz";
  }
  if (64 < word.codeUnitAt(0) && word.codeUnitAt(0) < 123)
    return Translit().unTranslit(source: word);
  else
    return Translit().toTranslit(source: word);
}









