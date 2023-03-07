import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:net_ninja_brew_crew/models/brew.dart';

class DatabaseService {
  final String? uid;
  
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> _brewListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((docs) {
      return Brew(
        name: docs.get('name') ?? '', //if does not exist
        strength: docs.get('strength') ?? 0,
        sugars: docs.get('strength') ?? '0',
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapShot);
  }
}
