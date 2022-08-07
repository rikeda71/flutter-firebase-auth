import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userFirestoreProvider = Provider.autoDispose(
  (_) => FirebaseFirestore.instance.collection('users'),
);
