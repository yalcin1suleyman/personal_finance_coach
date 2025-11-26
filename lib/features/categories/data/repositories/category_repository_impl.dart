import 'package:personal_finance_coach/features/categories/data/datasources/category_local_data_source.dart';
import 'package:personal_finance_coach/features/categories/domain/entities/category.dart';
import 'package:personal_finance_coach/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this._localDataSource);

  final CategoryLocalDataSource _localDataSource;

  @override
  Future<void> deleteCategory(String id) => _localDataSource.delete(id);

  @override
  Future<List<FinanceCategory>> getCategories() => _localDataSource.getCategories();

  @override
  Future<void> saveCategory(FinanceCategory category) => _localDataSource.upsert(category);

  @override
  Stream<List<FinanceCategory>> watchCategories() => _localDataSource.watchCategories();
}





