class Task{
  final String name;
  bool isDone = false;

  Task({required this.name});

  void toggleDone(){
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return ({'title':name,'check':isDone});
  }
}