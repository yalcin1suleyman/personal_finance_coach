import 'dart:async';

import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart' as constants;
import 'package:personal_finance_coach/core/utils/id_generator.dart';
import 'package:personal_finance_coach/features/categories/domain/entities/category.dart';

class CategoryLocalDataSource {
  CategoryLocalDataSource() : _box = Hive.box<FinanceCategory>(AppConstants.hiveCategoriesBox) {
    if (_box.isEmpty) {
      _seedDefaults();
    }
  }

  final Box<FinanceCategory> _box;

  Stream<List<FinanceCategory>> watchCategories() {
    return Stream<List<FinanceCategory>>.multi((controller) {
      void emitCategories() => controller.add(_box.values.toList());

      emitCategories();
      final subscription = _box.watch().listen((_) => emitCategories());
      controller.onCancel = subscription.cancel;
    });
  }

  Future<List<FinanceCategory>> getCategories() async => _box.values.toList();

  Future<void> upsert(FinanceCategory category) => _box.put(category.id, category);

  Future<void> delete(String id) => _box.delete(id);

  void _seedDefaults() {
    final now = DateTime.now();
    final seeds = [
      ...constants.AppConstants.defaultExpenseCategories,
      ...constants.AppConstants.defaultIncomeCategories,
    ];
    for (final seed in seeds) {
      final category = FinanceCategory(
        id: IdGenerator.generate(),
        name: seed.name,
        emoji: seed.emoji,
        type: seed.type,
        isEditable: false,
        createdAt: now,
      );
      _box.put(category.id, category);
    }
  }

  Future<void> dispose() async {
    // No-op.
  }
}




