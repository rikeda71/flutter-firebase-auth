import 'package:health/health.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final healthFactoryProvider = Provider.autoDispose((_) => HealthFactory());