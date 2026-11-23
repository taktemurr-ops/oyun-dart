import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dart/oyun_dart.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dartConfig.title.length, 33);
    expect(dartConfig.tagline.length, 33);
    for (final s in dartConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dartRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dartId, optionalMechanics: dartRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dartRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
