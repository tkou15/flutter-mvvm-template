import 'package:flapp/model/counter/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterRepository = Provider((ref) => CounterRepository());

class CounterRepository {
  var counter = const Counter(count: 0);

  Future<Counter> fetchCount() async {
    await Future.delayed(const Duration(seconds: 1));
    return counter;
  }

  Future<void> registerCount({required int count}) async {
    await Future.delayed(const Duration(seconds: 1));
    counter = Counter(count: count);
  }
}
