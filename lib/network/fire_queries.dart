import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';

import '../models/notification/notification_model.dart';
import '../models/policy/policy_model.dart';
import '../models/user/user_model.dart';
import '../network/my_collections.dart';

extension FireQueries on FirebaseFirestore {
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  CollectionReference<UserModel> get users => _firebaseFirestore.collection(MyCollections.users).withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<OrderModel> get orders => _firebaseFirestore.collection(MyCollections.orders).withConverter<OrderModel>(
        fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<Driver> get drivers => _firebaseFirestore.collection(MyCollections.drivers).withConverter<Driver>(
        fromFirestore: (snapshot, _) => Driver.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PolicyModel> get policies => _firebaseFirestore.collection(MyCollections.policies).withConverter<PolicyModel>(
        fromFirestore: (snapshot, _) => PolicyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<NotificationModel> get notifications => _firebaseFirestore.collection(MyCollections.notifications).withConverter<NotificationModel>(
        fromFirestore: (snapshot, _) => NotificationModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
