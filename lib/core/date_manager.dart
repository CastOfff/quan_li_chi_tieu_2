class DateManeger {
  DateTime selectedDate = DateTime.now();

  void updateDate(DateTime newDate) {
    selectedDate = newDate;
  }
}