class Pair<T, S> {
  T first;
  S second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return "Pair(first : ${first.toString()}, second : ${second.toString()})";
  }
}
