import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/enums/account_type.dart';
import 'package:personal_finance_coach/core/utils/id_generator.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/accounts/presentation/providers/account_providers.dart';

class AccountsScreen extends ConsumerStatefulWidget {
  const AccountsScreen({super.key});

  @override
  ConsumerState<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends ConsumerState<AccountsScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _balanceController;
  late final TextEditingController _iconController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _balanceController = TextEditingController();
    _iconController = TextEditingController(text: '💼');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountsAsync = ref.watch(accountsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Hesaplar')),
      body: accountsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Hata: $error')),
        data: (accounts) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final account = accounts[index];
            return ListTile(
              leading: CircleAvatar(child: Text(account.icon)),
              title: Text(account.name),
              subtitle: Text(account.type.label),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => ref.read(accountControllerProvider).delete(account.id),
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: accounts.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAccountDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAccountDialog(BuildContext context) async {
    _nameController.clear();
    _balanceController.clear();
    _iconController.text = '💼';

    AccountType selectedType = AccountType.cash;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                left: 16,
                right: 16,
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hesap Ekle', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Ad'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<AccountType>(
                    value: selectedType,
                    decoration: const InputDecoration(labelText: 'Tür'),
                    items: AccountType.values
                        .map((type) => DropdownMenuItem(value: type, child: Text(type.label)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedType = value ?? AccountType.cash),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _iconController,
                    decoration: const InputDecoration(labelText: 'İkon (emoji)'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _balanceController,
                    decoration: const InputDecoration(labelText: 'Başlangıç bakiyesi'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        final iconText = _iconController.text.trim().isEmpty ? '💼' : _iconController.text.trim();
                        final account = Account(
                          id: IdGenerator.generate(),
                          name: _nameController.text.trim(),
                          type: selectedType,
                          icon: iconText,
                          balance: double.tryParse(_balanceController.text) ?? 0,
                          createdAt: DateTime.now(),
                        );
                        ref.read(accountControllerProvider).save(account);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Kaydet'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

