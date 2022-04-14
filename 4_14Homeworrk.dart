import 'dart:core';

main() {
  print("4.14课程内容\n");
  var tea = 'BlackTea';
  print("I drink $tea.");
  //数字处理
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  //定义基数
  assert(int.parse('42', radix: 16) == 66);
  //转为字符串
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
  //字符串基本操作：
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  //在字符串中提出需要的数据：
  assert('Never odd or even'.substring(6, 9) == 'odd'); //不包括9
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3); //以空格为分隔符分开
  assert(parts[0] == 'progressive');
  assert('Never odd or even'[0] == 'N');

  for (final char in 'hello'.split('')) {
    print(char); //以空位分隔符，打印出所有的字母
  }
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  //大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');
  //trim移除首尾空格
  assert('  hello  '.trim() == 'hello');
  //判断是否为空
  assert(''.isEmpty);
  assert('  '.isNotEmpty);
  //替换部分字符串
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  assert(greeting != greetingTemplate);
  //构建字符串
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  sb.write('!');
  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.!');
  //正则表达式：
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  var numbers2 = RegExp(r'\d+');
  var someDigits2 = 'llamas live 15 to 20 years';
  assert(numbers.hasMatch(someDigits2));
  for (final match in numbers2.allMatches(someDigits2)) {
    print(match.group(0));
  }
  //集合类测试：
  var grains = <String>[];
  assert(grains.isEmpty);
  var fruits = ['apples', 'oranges'];
  fruits.add('kiwis');
  fruits.addAll(['grapes', 'bananas']);
  assert(fruits.length == 5);
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  fruits.clear();
  assert(fruits.isEmpty);
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
  //查找下标值：
  var fruits2 = ['apples', 'oranges'];
  assert(fruits2[0] == 'apples');
  assert(fruits2.indexOf('apples') == 0);
  //排序list
  var fruits3 = ['bananas', 'apples', 'oranges'];
  fruits3.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  //限定了数据智智能是string
  var fruits4 = <String>[];
  fruits4.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
  //测试sets：
  var ingredients = <String>{};
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  ingredients.add('gold');
  assert(ingredients.length == 3);
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  var atomicNumbers = Set.from([79, 22, 54]);
  //检查元素是否在set中：
  var ingredients2 = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients2.contains('titanium'));
  assert(ingredients2.containsAll(['titanium', 'xenon']));
  //交集
  var ingredients3 = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients3.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
  //maps测试：
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  var searchTerms = Map();
  var nobleGases2 = Map<int, String>();

  var nobleGases3 = {54: 'xenon'};
  assert(nobleGases3[54] == 'xenon');
  assert(nobleGases3.containsKey(54));
  nobleGases.remove(54);
  assert(!nobleGases3.containsKey(54));

  var hawaiianBeaches2 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  var keys = hawaiianBeaches2.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  var values = hawaiianBeaches2.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  var hawaiianBeaches3 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  assert(hawaiianBeaches3.containsKey('Oahu'));
  assert(!hawaiianBeaches3.containsKey('Florida'));

  //putifAbsent:
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => '123');
  assert(teamAssignments['Catcher'] != null);
  //g公共集合方法
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
  //每个元素都使用一个方法：
  var teas2 = ['green', 'black', 'chamomile', 'earl grey'];
  teas2.forEach((tea) => print('I drink $tea'));

  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
  });
  //map方法：
  var teas3 = ['green', 'black', 'chamomile', 'earl grey'];
  var loudTeas = teas3.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
  var loudTeas2 = teas.map((tea) => tea.toUpperCase()).toList();
  print(loudTeas2);

  var teas4 = ['green', 'black', 'chamomile', 'earl grey'];
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
  var decaffeinatedTeas = teas4.where((tea) => isDecaffeinated(tea));
  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
  //URI处理:
  var uri = 'https://example.org/api?foo=some message';
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');
  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  var uri2 = 'https://example.org/api?foo=some message';
  var encoded2 = Uri.encodeComponent(uri);
  assert(encoded2 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  var decoded2 = Uri.decodeComponent(encoded2);
  assert(uri2 == decoded2);

  var uri3 = Uri.parse('https://example.org:8080/foo/bar#frag');
  assert(uri3.scheme == 'https');
  assert(uri3.host == 'example.org');
  assert(uri3.path == '/foo/bar');
  assert(uri3.fragment == 'frag');
  assert(uri3.origin == 'https://example.org:8080');

  var uri4 = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri.toString() == 'https://example.org/foo/bar#frag');
  //日期和时间：DateTime：
  var now = DateTime.now();
  var y2k = DateTime(2000);
  y2k = DateTime(2000, 1, 2);
  y2k = DateTime.utc(2000);
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  // millisecondsSinceEpoch
  var y2k_ = DateTime.utc(2000);
  assert(y2k_.millisecondsSinceEpoch == 946684800000);
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  var y2k_1 = DateTime.utc(2000);
  var y2001 = y2k_1.add(const Duration(days: 366));
  assert(y2001.year == 2001);
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);
  var duration = y2001.difference(y2k_1);
  assert(duration.inDays == 366);
  //测试comparable接口：
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);

  var pe1 = Person('Bob', 'Smith');
  var pe2 = Person('Bob', 'Smith');
  var pe3 = 'not a person';
  assert(pe1.hashCode == pe2.hashCode);
  assert(pe1 == pe2);
  assert(pe1 != pe3);
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;
  Person(this.firstName, this.lastName);
  int get hashCode => Object.hash(firstName, lastName);
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  Process get current => current;
  @override
  bool moveNext() => moveNext();
}

class FooException implements Exception {
  final String? msg;
  const FooException([this.msg]);
  String toString() => msg ?? 'FooException';
}
