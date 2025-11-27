import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/providers/app_providers.dart';
import 'package:personal_finance_coach/features/categories/domain/entities/category.dart';
import 'package:personal_finance_coach/features/categories/domain/repositories/category_repository.dart';

final categoriesStreamProvider = StreamProvider<List<FinanceCategory>>((ref) {
  return ref.watch(categoryRepositoryProvider).watchCategories();
});

final categoryControllerProvider = Provider<CategoryController>((ref) {
  return CategoryController(ref.watch(categoryRepositoryProvider));
});

class CategoryController {
  CategoryController(this._repository);

  final CategoryRepository _repository;

  Future<void> save(FinanceCategory category) => _repository.saveCategory(category);

  Future<void> delete(String id) => _repository.deleteCategory(id);
}






