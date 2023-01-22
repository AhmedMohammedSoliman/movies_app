import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/FireBaseModel/FireBaseModel.dart';

class FireBaseFun {

  static CollectionReference<FavouriteModel> getCollectionFromFireBase (){
    return FirebaseFirestore.instance.collection('movie').withConverter<FavouriteModel>(
      fromFirestore: (snapshot, _) => FavouriteModel.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
  }

 static Future<void> addMovieToFireBase(FavouriteModel movie){
    var collection = getCollectionFromFireBase() ;
    var doc = collection.doc() ;
    movie.id = doc.id ;
   return  doc.set(movie) ;
  }

  static Stream<QuerySnapshot<FavouriteModel>> getMoviesFromFireBase () {
  return  getCollectionFromFireBase().snapshots() ;
  }
  static Future<void> deleteMovieFromFireBase (String movieId) async {
    return await getCollectionFromFireBase().doc(movieId).delete();
  }
}