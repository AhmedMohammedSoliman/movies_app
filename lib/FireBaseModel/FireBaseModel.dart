class FavouriteModel {

 String id;

 String date;

 String title;

 String image;

 String originTitle;

 FavouriteModel({this.id = "", required this.title, required this.image,
  required this.date, required this.originTitle});

 FavouriteModel.fromJson(Map<String, Object?> json)
     : this(
  title: json['title']! as String,
  date: json['date']! as String,
  image: json['image']! as String,
  originTitle: json['original_title']! as String,
  id: json['id']! as String,
 );

 Map<String, Object?> toJson() {
  return {
   'title': title,
   'original_title': originTitle,
   'date': date,
   'image': image,
   'id': id,
  };
 }
}