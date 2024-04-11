class MyDateUtils{
  static Stream<String> get timeStream async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      final currentTime = DateTime.now();
      final currentHour = currentTime.hour;
      if (currentHour >= 0 && currentHour < 12) {
        yield 'Good Morning';
      } else if (currentHour >= 12 && currentHour < 18) {
        yield 'Good Afternoon';
      } else {
        yield 'Good Evening';
      }
    }
  }
}