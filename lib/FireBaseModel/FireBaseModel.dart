class FavouriteModel {

 String id;

 String date;

 String title;

 String image;

 String lan;

 FavouriteModel({this.id = "", required this.title, required this.image,
  required this.date, required this.lan});

 FavouriteModel.fromJson(Map<String, Object?> json)
     : this(
  title: json['title']! as String,
  date: json['date']! as String,
  image: json['image']! as String,
  lan: json['lan']! as String,
  id: json['id']! as String,
 );

 Map<String, Object?> toJson() {
  return {
   'title': title,
   'lan': lan,
   'date': date,
   'image': image,
   'id': id,
  };
 }
}