import 'package:personal_finance_coach/features/categories/domain/entities/category.dart';

abstract class CategoryRepository {
  Stream<List<FinanceCategory>> watchCategories();
  Future<List<FinanceCategory>> getCategories();
  Future<void> saveCategory(FinanceCategory category);
  Future<void> deleteCategory(String id);
}






