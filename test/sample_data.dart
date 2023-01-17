import 'package:markdown_parser/parser.dart';

const sample1 = """   # **h1__**__alsdkjlaskjdf__
## https://hello""";

const sample2 = """   # **h1__**__alsdkjlaskjdf__http://ぁＳＤＫＪ
## https://hello
 :::info as;dfka;sld__kfa;lsd__kfhttp://l
> lakjsflaksjhttp://dlfkajs ;alksd;lfkas""";

final guess1 = [
  ParsedLine(
    type: LineType.h1,
    text: "   # __h1__",
    blocks: [
      ParsedBlock(type: BlockType.text, text: "   "),
      ParsedBlock(type: BlockType.symbol, text: "#"),
      ParsedBlock(type: BlockType.text, text: " "),
      ParsedBlock(type: BlockType.italic, text: "__h1__")
    ],
  ),
  ParsedLine(
    type: LineType.h2,
    text: "## https://hello",
    blocks: [
      ParsedBlock(type: BlockType.symbol, text: "##"),
      ParsedBlock(type: BlockType.text, text: " "),
      ParsedBlock(type: BlockType.link, text: "https://hello")
    ],
  ),
];
