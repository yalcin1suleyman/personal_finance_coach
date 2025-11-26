import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/enums/category_type.dart';
import 'package:personal_finance_coach/core/utils/id_generator.dart';
import 'package:personal_finance_coach/features/categories/domain/entities/category.dart';
import 'package:personal_finance_coach/features/categories/presentation/providers/category_providers.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emojiController = TextEditingController(text: '🧾');

  @override
  void dispose() {
    _nameController.dispose();
    _emojiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Kategoriler')),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Hata: $error')),
        data: (categories) => ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              leading: Text(category.emoji, style: const TextStyle(fontSize: 24)),
              title: Text(category.name),
              subtitle: Text(category.type.label),
              trailing: category.isEditable
                  ? IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => ref.read(categoryControllerProvider).delete(category.id),
                    )
                  : const Icon(Icons.lock_outline, size: 18),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCategoryDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async {
    _nameController.clear();
    _emojiController.text = '🧾';
    CategoryType selectedType = CategoryType.expense;

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Kategori Ekle'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Ad'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _emojiController,
                  decoration: const InputDecoration(labelText: 'Emoji'),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<CategoryType>(
                  value: selectedType,
                  items: CategoryType.values
                      .map((type) => DropdownMenuItem(value: type, child: Text(type.label)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedType = value ?? CategoryType.expense),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('İptal')),
            FilledButton(
              onPressed: () {
                final category = FinanceCategory(
                  id: IdGenerator.generate(),
                  name: _nameController.text.trim(),
                  emoji: _emojiController.text.trim().isEmpty ? '🧾' : _emojiController.text.trim(),
                  type: selectedType,
                  isEditable: true,
                  createdAt: DateTime.now(),
                );
                ref.read(categoryControllerProvider).save(category);
                Navigator.of(context).pop();
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

