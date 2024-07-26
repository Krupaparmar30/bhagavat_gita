import 'dart:math';

class GitaModal{
  late int chapter;
  late List<Verse> verses;
  late ChapterNumber chapterNumber;

  GitaModal({required this.chapter, required this.verses, required this.chapterNumber});
  factory GitaModal.fromJson(Map m1)
  {
    return GitaModal(chapter: m1['Chapter'], verses:( m1['Verses'] as List).map((e)=>Verse.fromJson(e)).toList(), chapterNumber: ChapterNumber.fromJson(m1['ChapterName']));
  }

}
class ChapterNumber{
  late String hindi, english, gujarati, sanskrit;

  ChapterNumber({required this.hindi, required this.english, required this.gujarati, required this.sanskrit});
  factory ChapterNumber.fromJson(Map m1)
  {
    return ChapterNumber(hindi: m1['Hindi'], english: m1['English'], gujarati: m1['Gujarati'], sanskrit: m1['Sanskrit']);
  }
}
class Verse{
  late int verseNumber;
 late Lan text;

  Verse({required this.verseNumber, required this.text});
  factory Verse.fromJson(Map m1)
  {
    return Verse(verseNumber: m1['VerseNumber'], text: Lan.fromJson(m1['Text']));
  }
}
class Lan{
  late String sanskrit, hindi, gujarati, english;

  Lan({required this.sanskrit,required  this.hindi,required  this.gujarati, required this.english});
  factory Lan.fromJson(Map m1)
  {
    return Lan(sanskrit: m1['Sanskrit'], hindi: m1['Hindi'], gujarati: m1['Gujarati'], english: m1['English']);
  }
}