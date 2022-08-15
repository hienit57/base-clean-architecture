part of 'base_cubit.dart';

extension Lell<T> on BehaviorSubject<List<T>> {
  remove(bool finder(T)) {
    final vl = value;

    vl.removeWhere(finder);
    add(vl);
  }

  insert(T item, int index) {
    final vl = value;
    if (index < vl.length) {
      vl.insert(index, item);
    } else {
      vl.add(item);
    }
    add(vl);
  }
}

extension Bell<T> on Subject<T> {
  wellAdd(T data) {
    if (isClosed) return;
    add(data);
  }
}

extension Mess on Map<dynamic, List<StreamSubscription>> {
  dispose() {
    for (var item in values) {
      item.dispose();
    }
    clear();
  }

  List<StreamSubscription>? getSubs(String id) {
    if (id.isNullOrEmpty) return null;
    var subs = this[id];
    if (subs != null) return subs;
    subs = putIfAbsent(id, () => []);
    return subs;
  }
}

extension Mell<T> on Map<dynamic, BehaviorSubject<T>> {
  dispose() {
    for (var item in values) {
      final value = item.value;
      if (value is List) value.clear();
      item.close();
    }
    clear();
  }

  BehaviorSubject? getStream(String id) {
    if (id.isNullOrEmpty) return null;
    var stream = this[id];
    if (stream != null) {
      return stream;
    }
    stream = putIfAbsent(id, () => BehaviorSubject<T>());
    return stream;
  }
}

extension Lel on List<StreamSubscription> {
  dispose() {
    forEach((sub) => sub.cancel());
    clear();
  }
}
