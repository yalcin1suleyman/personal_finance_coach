import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance_coach/core/enums/theme_preference.dart';
import 'package:personal_finance_coach/features/profile/presentation/providers/profile_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameController = TextEditingController();
  final _incomeController = TextEditingController();
  final _workHoursController = TextEditingController();
  ThemePreference _themePreference = ThemePreference.system;
  String _currencyCode = 'TRY';

  @override
  void dispose() {
    _nameController.dispose();
    _incomeController.dispose();
    _workHoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileStreamProvider);

    return profileAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, _) => Scaffold(body: Center(child: Text('Hata: $error'))),
      data: (profile) {
        if (_nameController.text != profile.name) {
          _nameController.text = profile.name;
        }
        if (_incomeController.text != profile.monthlyIncome.toStringAsFixed(0)) {
          _incomeController.text = profile.monthlyIncome.toStringAsFixed(0);
        }
        if (_workHoursController.text != profile.weeklyWorkHours.toStringAsFixed(0)) {
          _workHoursController.text = profile.weeklyWorkHours.toStringAsFixed(0);
        }
        _themePreference = profile.themePreference;
        _currencyCode = profile.currencyCode;

        return Scaffold(
          appBar: AppBar(title: const Text('Profil & Ayarlar')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Kişisel Bilgiler', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Adınız'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _incomeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Aylık Net Gelir'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _workHoursController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Haftalık Çalışma Saati'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _currencyCode,
                decoration: const InputDecoration(labelText: 'Para Birimi'),
                items: const [
                  DropdownMenuItem(value: 'TRY', child: Text('TRY ₺')),
                  DropdownMenuItem(value: 'USD', child: Text('USD \$')),
                  DropdownMenuItem(value: 'EUR', child: Text('EUR €')),
                  DropdownMenuItem(value: 'GBP', child: Text('GBP £')),
                ],
                onChanged: (value) => setState(() => _currencyCode = value ?? 'TRY'),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  title: const Text('Saatlik kazanç'),
                  subtitle: const Text('Aylık gelir / (Haftalık saat × 4)'),
                  trailing: Text('${profile.hourlyIncome.toStringAsFixed(2)} $_currencyCode'),
                ),
              ),
              const SizedBox(height: 16),
              Text('Tema', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              SegmentedButton<ThemePreference>(
                segments: ThemePreference.values
                    .map((pref) => ButtonSegment(value: pref, label: Text(pref.label)))
                    .toList(),
                selected: {_themePreference},
                onSelectionChanged: (value) => setState(() => _themePreference = value.first),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () async {
                  final updated = profile.copyWith(
                    name: _nameController.text.trim(),
                    monthlyIncome: double.tryParse(_incomeController.text) ?? profile.monthlyIncome,
                    weeklyWorkHours: double.tryParse(_workHoursController.text) ?? profile.weeklyWorkHours,
                    currencyCode: _currencyCode,
                    themePreference: _themePreference,
                  );
                  final messenger = ScaffoldMessenger.of(context);
                  await ref.read(profileControllerProvider).save(updated);
                  if (!mounted) return;
                  messenger.showSnackBar(const SnackBar(content: Text('Profil güncellendi')));
                },
                child: const Text('Kaydet'),
              ),
              const SizedBox(height: 24),
              Text('Yönetim', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet_outlined),
                title: const Text('Hesapları yönet'),
                onTap: () => context.push('/accounts'),
              ),
              ListTile(
                leading: const Icon(Icons.category_outlined),
                title: const Text('Kategorileri yönet'),
                onTap: () => context.push('/categories'),
              ),
              ListTile(
                leading: const Icon(Icons.file_download_outlined),
                title: const Text('Verileri dışa aktar (JSON)'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('JSON dışa aktarma yakında.')));
                },
              ),
              ListTile(
                leading: const Icon(Icons.backup_outlined),
                title: const Text('Yedek al / yükle'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Yedekleme yakında.')));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

