import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:markdown_parser/markdown_parser.dart';

import 'sample_data.dart';

void main() {
  // compare objects
  void show(List<ParsedLine> res) {
    for (final line in res) {
      debugPrint("line: ${line.type} \"${line.text}\"");
      for (final block in line.blocks) {
        debugPrint("    block: ${block.type} \"${block.text}\"");
      }
    }
  }

  bool comp(
    List<ParsedLine> res,
    List<ParsedLine> ges,
  ) {
    for (int i = 0; i < res.length; i++) {
      if (res[i].type != ges[i].type || res[i].text != ges[i].text) {
        debugPrint("res[$i]");
        debugPrint("res : ${res[i].type.name} ${res[i].text}");
        return false;
      }
      for (int j = 0; j < res[i].blocks.length; j++) {
        if (res[i].blocks[j].type != ges[i].blocks[j].type ||
            res[i].blocks[j].text != ges[i].blocks[j].text) {
          debugPrint("res[$i].blocks[$j]");
          debugPrint(
              "res : ${res[i].blocks[j].type} | ${res[i].blocks[j].text}");
          return false;
        }
      }
    }
    return true;
  }

  test("check string oper", () {
    final text = """j
;fk;aslkdf;laskdf;lakdf
"""
        .split("\n");
    expect(text.length, 2);
  });

  test('check header', () {
    final parser = MarkdownParser();
    const sample = sample1;
    final res = parser.parse(sample);

    final guess = guess1;

    expect(true, comp(res, guess));
    show(res);
    // expect(true, true);
  });

  test("show parsed result", () {
    final parser = MarkdownParser();
    // final res1 = parser.parse(sample1);
    final res2 = parser.parse(sample2);
    // show(res1);
    show(res2);
    expect(true, true);
  });
}
