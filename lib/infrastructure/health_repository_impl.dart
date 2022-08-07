import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_auth/domain/profile/health/health_repository.dart';
import 'package:flutter_firebase_auth/domain/profile/health/steps.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthRepositoryImpl implements HealthRepository {
  HealthRepositoryImpl(this._healthFactory, this._store);

  final HealthFactory _healthFactory;
  final CollectionReference<Map<String, dynamic>> _store;

  static const types = [
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.STEPS,
    HealthDataType.DISTANCE_DELTA,
  ];

  @override
  Future<Steps> getSteps(String uid) async {
    final now = DateTime.now();
    // permission_handler による権限設定
    final activityRecognitionPermitStatus =
        await Permission.activityRecognition.request();
    // 失敗した場合はアプリケーションの設定を開く
    if (activityRecognitionPermitStatus.isDenied) {
      await Future.delayed(const Duration(seconds: 1));
      await openAppSettings();
    }
    final requested =
        await _healthFactory.requestAuthorization(types, permissions: [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ]);
    if (!requested) {
      return const Steps(count: 0);
    }
    // 歩数データがなかったりするので、データを書き込む
    // await _healthFactory.writeHealthData(
    //     1234, HealthDataType.STEPS, now.subtract(const Duration(days: 1)), now);
    // await _healthFactory.writeHealthData(
    //     123,
    //     HealthDataType.ACTIVE_ENERGY_BURNED,
    //     now.subtract(const Duration(days: 1)),
    //     now);
    // await _healthFactory.writeHealthData(12345, HealthDataType.DISTANCE_DELTA,
    //     now.subtract(const Duration(days: 1)), now);

    int? steps = await _healthFactory.getTotalStepsInInterval(
        now.subtract(const Duration(days: 1)), now);
    final healthData = await _healthFactory.getHealthDataFromTypes(
        now.subtract(const Duration(days: 1)), now, types);
    if (healthData.isNotEmpty) {
      final dedupedHealthData = HealthFactory.removeDuplicates(healthData);
      _store.doc(uid).collection('health').doc(uid).set({
        'burnedCulories': dedupedHealthData[0].value.toString(),
        'stepsOfDay': dedupedHealthData[1].value.toString(),
        'distanceOfDay': dedupedHealthData[2].value.toString()
      });
    } else {
      print('---');
      print('health data not get');
      print('---');
    }
    print('step');
    print(steps);
    int count = steps ?? 100;
    print('count');
    print(count);

    return Steps(count: count);
  }
}
