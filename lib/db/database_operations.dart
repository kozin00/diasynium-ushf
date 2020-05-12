import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseOperations {
  final _firestore = Firestore.instance;

  Future<List<DocumentSnapshot>> getCategories() =>
      _firestore.collection('categories').getDocuments().then((snap) {
        return snap.documents;
      });

  Future<List<DocumentSnapshot>> getProducts() =>
      _firestore.collection('products').getDocuments().then((snap) {
        return snap.documents;
      });

  Future<List<DocumentSnapshot>> getProductsInCategory(String category) =>
      _firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .getDocuments()
          .then((snap) {
        return snap.documents;
      });

  Future<List<DocumentSnapshot>> product(String id) => _firestore
          .collection('products')
          .where('id', isEqualTo: id)
          .getDocuments()
          .then((snap) {
        return snap.documents;
      });

  Future<List<DocumentSnapshot>> getFavourites(String id) => _firestore
          .collection('users')
          .where('id', isEqualTo: id)
          .getDocuments()
          .then((snap) {
        return snap.documents;
      });

  void updateFavourites(HashMap favourites, String id) {
    _firestore
        .collection('users')
        .document(id)
        .updateData({'favourites': favourites});
  }
}
