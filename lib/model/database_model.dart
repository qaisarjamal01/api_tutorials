class DatabaseModel{
  final int id;
  final String name;
  final int age;

  DatabaseModel({
   required this.id,
   required this.name,
   required this.age,
});

  factory DatabaseModel.fromMap(Map<String,dynamic> map){
    return DatabaseModel(id: map['id'], name: map['name'], age: map['age']);
  }

  Map<String,Object?> toMap(){
    return {
      'id':id,
      'name':name,
      'age':age
    };
  }
}