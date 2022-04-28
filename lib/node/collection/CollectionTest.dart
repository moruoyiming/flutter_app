import 'dart:collection';

void main() {
  final Map<int, String> planets = HashMap(); // Is a HashMap
  planets[3] = 'Earth';
  planets.addAll({4: 'Mars'});
  final gasGiants = {6: 'Jupiter', 5: 'Saturn'};
  planets.addEntries(gasGiants.entries);
  print(planets); // fx {5: Saturn, 6: Jupiter, 3: Earth, 4: Mars}
  // isEmpty or isNotEmpty  length
  final isEmpty = planets.isEmpty; // false
  final length = planets.length; // 4
  //遍历循环
  planets.forEach((key, value) {
    print('$key \t $value');
    // 5        Saturn
    // 4        Mars
    // 3        Earth
    // 6        Jupiter
  });
  //containsKey
  final keyOneExists = planets.containsKey(4); // true
  final keyFiveExists = planets.containsKey(1); // false
  //containsValue
  final marsExists = planets.containsValue('Mars'); // true
  final venusExists = planets.containsValue('Venus'); // false
  //remove
  final removeValue = planets.remove(5);
  print(removeValue); // Jupiter
  print(planets); // fx {4: Mars, 3: Earth, 5: Saturn}
  //removeWhere
  planets.removeWhere((key, value) => key == 5);
  print(planets); // fx {3: Earth, 4: Mars}
  //putIfAbsent or update.
  planets.update(4, (v) => 'Saturn');
  planets.update(8, (v) => '', ifAbsent: () => 'Neptune');
  planets.putIfAbsent(4, () => 'Another Saturn');
  print(planets); // fx {4: Saturn, 8: Neptune, 3: Earth}
  //updateAll
  planets.updateAll((key, value) => 'X');
  print(planets); // fx {8: X, 3: X, 4: X}
  //clear
  planets.clear();
  print(planets); // {}
  print(planets.isEmpty); // true

  final queue = ListQueue<int>();
  queue.add(5);
  queue.addFirst(0);
  queue.addLast(10);
  queue.addAll([1, 2, 3]);
  print(queue); // {0, 5, 10, 1, 2, 3}
  //length
  final isEmpty1 = queue.isEmpty; // false
  final queueSize = queue.length; // 6
  //first or last
  final first = queue.first; // 0
  final last = queue.last; // 3
  //elementAt
  final itemAt = queue.elementAt(2); // 10
  //toList
  final numbers = queue.toList();
  print(numbers); // [0, 5, 10, 1, 2, 3]
  //remove, removeFirst or removeLast
  queue.remove(10);
  queue.removeFirst();
  queue.removeLast();
  print(queue); // {5, 1, 2}
  //removeWhere
  queue.removeWhere((element) => element == 1);
  print(queue); // {5, 2}
  //retainWhere
  queue.retainWhere((element) => element < 4);
  print(queue); // {2}
  //clear
  queue.clear();
  print(queue.isEmpty); // true
  print(queue); // {}


  final queue1 = Queue<int>(); // ListQueue() by default
  print(queue1.runtimeType); // ListQueue
// Adding items to queue
  queue1.addAll([1, 2, 3]);
  queue1.addFirst(0);
  queue1.addLast(10);
  print(queue1); // {0, 1, 2, 3, 10}
// Removing items from queue
  queue1.removeFirst();
  queue1.removeLast();
  print(queue1); // {1, 2, 3}
}
