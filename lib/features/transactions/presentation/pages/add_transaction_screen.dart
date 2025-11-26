import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance_coach/core/enums/category_type.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';
import 'package:personal_finance_coach/core/extensions/date_extensions.dart';
import 'package:personal_finance_coach/core/utils/id_generator.dart';
import 'package:personal_finance_coach/features/accounts/presentation/providers/account_providers.dart';
import 'package:personal_finance_coach/features/categories/presentation/providers/category_providers.dart';
import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';
import 'package:personal_finance_coach/features/profile/presentation/providers/profile_providers.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';
import 'package:personal_finance_coach/features/transactions/presentation/providers/transaction_providers.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key, required this.initialIsIncome});

  final bool initialIsIncome;

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  late bool _isIncome = widget.initialIsIncome;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Mood _selectedMood = Mood.neutral;
  String? _selectedAccountId;
  String? _selectedCategoryId;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  double _parseAmount() {
    final sanitized = _amountController.text.replaceAll(',', '.');
    return double.tryParse(sanitized) ?? 0;
  }

  double _computeEffortHours(double hourlyIncome) {
    if (_isIncome || hourlyIncome <= 0) return 0;
    final amount = _parseAmount();
    if (amount <= 0) return 0;
    return amount / hourlyIncome;
  }

  Future<void> _submit() async {
    final profile = ref.read(profileStreamProvider).valueOrNull ?? UserProfile.empty();
    final title = _titleController.text.trim();
    final amount = _parseAmount();
    if (title.isEmpty || amount <= 0 || _selectedAccountId == null || _selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final now = DateTime.now();
    final effortHours = _computeEffortHours(profile.hourlyIncome);

    final transaction = FinanceTransaction(
      id: IdGenerator.generate(),
      isIncome: _isIncome,
      amount: amount,
      title: title,
      description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
      date: _selectedDate,
      accountId: _selectedAccountId!,
      categoryId: _selectedCategoryId!,
      receiptPath: null,
      mood: _selectedMood,
      regret: null,
      effortHours: effortHours,
      createdAt: now,
      updatedAt: now,
      regretAskedAt: null,
    );

    await ref.read(transactionControllerProvider).addOrUpdate(transaction);
    if (mounted) {
      setState(() => _isSubmitting = false);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileStreamProvider);
    final accountsAsync = ref.watch(accountsStreamProvider);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final profile = profileAsync.valueOrNull ?? UserProfile.empty();
    final accounts = accountsAsync.value ?? [];
    final categories = (categoriesAsync.value ?? [])
        .where((category) => _isIncome ? category.type.isIncome : category.type.isExpense)
        .toList();
    final effort = _computeEffortHours(profile.hourlyIncome);
    final hasErrors = profileAsync.hasError || accountsAsync.hasError || categoriesAsync.hasError;
    final isFetching = profileAsync.isLoading || accountsAsync.isLoading || categoriesAsync.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isIncome ? 'Gelir Ekle' : 'Gider Ekle'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isFetching)
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: LinearProgressIndicator(),
              ),
            if (hasErrors)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MaterialBanner(
                  content: const Text('Veriler yüklenirken bir sorun oluştu. Tekrar denersen düzelecektir.'),
                  leading: const Icon(Icons.error_outline),
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                  actions: [
                    TextButton(
                      onPressed: () {
                        ref.invalidate(profileStreamProvider);
                        ref.invalidate(accountsStreamProvider);
                        ref.invalidate(categoriesStreamProvider);
                      },
                      child: const Text('Yenile'),
                    ),
                  ],
                ),
              ),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: true, icon: Icon(Icons.arrow_downward_rounded), label: Text('Gelir')),
                ButtonSegment(value: false, icon: Icon(Icons.arrow_upward_rounded), label: Text('Gider')),
              ],
              selected: {_isIncome},
              onSelectionChanged: (newSelection) => setState(() {
                _isIncome = newSelection.first;
                _selectedCategoryId = null;
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Başlık'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Tutar (${profile.currencyCode})',
                suffixText: profile.currencyCode,
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            if (accounts.isEmpty)
              _EmptyHelperCard(
                icon: Icons.account_balance_wallet_outlined,
                message: 'Henüz hesap oluşturmadın.',
                actionLabel: 'Hesap Oluştur',
                onTap: () => context.push('/accounts'),
              )
            else
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Hesap'),
                value: _selectedAccountId,
                items: accounts
                    .map((account) => DropdownMenuItem(
                          value: account.id,
                          child: Text(account.name),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedAccountId = value),
              ),
            const SizedBox(height: 12),
            if (categories.isEmpty)
              _EmptyHelperCard(
                icon: Icons.category_outlined,
                message: 'Uygun kategori bulunamadı.',
                actionLabel: 'Kategori Yönet',
                onTap: () => context.push('/categories'),
              )
            else
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Kategori'),
                value: _selectedCategoryId,
                items: categories
                    .map((category) => DropdownMenuItem(
                          value: category.id,
                          child: Text('${category.emoji} ${category.name}'),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedCategoryId = value),
              ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Açıklama (opsiyonel)'),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Tarih'),
              subtitle: Text(_selectedDate.dayMonthYear),
              trailing: IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                    helpText: 'İşlem Tarihi',
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            Text('Duygu Durumu', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: Mood.values
                  .map((mood) => ChoiceChip(
                        label: Text(mood.label),
                        avatar: Icon(mood.icon, color: mood.color, size: 16),
                        selected: _selectedMood == mood,
                        onSelected: (_) => setState(() => _selectedMood = mood),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Efor Analizi', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      _isIncome
                          ? 'Gelir işlemleri efor hesabına dahil edilmez.'
                          : 'Bu harcama ≈ ${effort.toStringAsFixed(2)} saat emeğine denk geliyor.',
                    ),
                    if (!_isIncome) ...[
                      const SizedBox(height: 4),
                      Text('≈ ${(effort * 60 / 25).toStringAsFixed(0)} odak bloğu'),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _isSubmitting ? null : _submit,
              icon: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: Text(_isIncome ? 'Geliri Kaydet' : 'Gideri Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyHelperCard extends StatelessWidget {
  const _EmptyHelperCard({
    required this.icon,
    required this.message,
    required this.actionLabel,
    required this.onTap,
  });

  final IconData icon;
  final String message;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(child: Text(message)),
            TextButton(onPressed: onTap, child: Text(actionLabel)),
          ],
        ),
      ),
    );
  }
}

