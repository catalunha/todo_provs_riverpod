import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo_datasource.dart';

final todoDataSource = Provider((ref) => TodoDataSource());
