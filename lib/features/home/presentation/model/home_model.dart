class HomeModel {
  HomeModel(
      {required this.userId,
      required this.id,
      required this.name,
      required this.body,
      this.isDone = false});

  final int userId;
  final int id;
  final String body;
  final String name;
  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        userId: json['userId'],
        id: json['id'],
        name: json['title'],
        body: json['body'],
      );
}
