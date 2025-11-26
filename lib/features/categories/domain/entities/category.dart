import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/enums/category_type.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
@HiveType(typeId: 3)
class FinanceCategory with _$FinanceCategory {
  const factory FinanceCategory({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String emoji,
    @HiveField(3) required CategoryType type,
    @HiveField(4) required bool isEditable,
    @HiveField(5) required DateTime createdAt,
  }) = _FinanceCategory;

  const FinanceCategory._();

  factory FinanceCategory.fromJson(Map<String, dynamic> json) => _$FinanceCategoryFromJson(json);
}





