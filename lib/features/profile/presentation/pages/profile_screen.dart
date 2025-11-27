import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/mood.dart';
import '../../../analysis/domain/models/analysis_summary.dart';
import '../../../analysis/presentation/providers/analysis_providers.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/profile_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameController = TextEditingController();
  final _incomeController = TextEditingController();
  final _workHoursController = TextEditingController();
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
    final emotionSummaryAsync = ref.watch(analysisSummaryProvider);

    return profileAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, _) => Scaffold(body: Center(child: Text('Hata: $error'))),
      data: (profile) {
        _syncControllers(profile);

        return Scaffold(
          appBar: AppBar(title: const Text('Profil')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _ProfileFormCard(
                  nameController: _nameController,
                  incomeController: _incomeController,
                  workHoursController: _workHoursController,
                  currencyCode: _currencyCode,
                  onCurrencyChanged: (value) => setState(() => _currencyCode = value),
                  onSave: () => _saveProfile(profile),
                  hourlyIncome: profile.hourlyIncome,
                ),
                const SizedBox(height: 16),
                _EmotionSummaryCard(summaryAsync: emotionSummaryAsync),
                const SizedBox(height: 16),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Ayarlar'),
                    subtitle: const Text('Tema ve diğer tercihleri yönet'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/settings'),
                  ),
                ),
                const SizedBox(height: 16),
                _ManagementCard(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _syncControllers(UserProfile profile) {
    if (_nameController.text != profile.name) {
      _nameController.text = profile.name;
    }
    final incomeText = profile.monthlyIncome.toStringAsFixed(0);
    if (_incomeController.text != incomeText) {
      _incomeController.text = incomeText;
    }
    final workHoursText = profile.weeklyWorkHours.toStringAsFixed(0);
    if (_workHoursController.text != workHoursText) {
      _workHoursController.text = workHoursText;
    }
    _currencyCode = profile.currencyCode;
  }

  Future<void> _saveProfile(UserProfile profile) async {
    final updated = profile.copyWith(
      name: _nameController.text.trim(),
      monthlyIncome: double.tryParse(_incomeController.text) ?? profile.monthlyIncome,
      weeklyWorkHours: double.tryParse(_workHoursController.text) ?? profile.weeklyWorkHours,
      currencyCode: _currencyCode,
    );
    final messenger = ScaffoldMessenger.of(context);
    await ref.read(profileControllerProvider).save(updated);
    if (!mounted) return;
    messenger.showSnackBar(const SnackBar(content: Text('Profil güncellendi')));
  }
}

class _ProfileFormCard extends StatelessWidget {
  const _ProfileFormCard({
    required this.nameController,
    required this.incomeController,
    required this.workHoursController,
    required this.currencyCode,
    required this.onCurrencyChanged,
    required this.onSave,
    required this.hourlyIncome,
  });

  final TextEditingController nameController;
  final TextEditingController incomeController;
  final TextEditingController workHoursController;
  final String currencyCode;
  final ValueChanged<String> onCurrencyChanged;
  final VoidCallback onSave;
  final double hourlyIncome;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Kişisel Bilgiler', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Adınız'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: incomeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Aylık Net Gelir'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: workHoursController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Haftalık Çalışma Saati'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: currencyCode,
              decoration: const InputDecoration(labelText: 'Para Birimi'),
              items: const [
                DropdownMenuItem(value: 'TRY', child: Text('TRY ₺')),
                DropdownMenuItem(value: 'USD', child: Text('USD \$')),
                DropdownMenuItem(value: 'EUR', child: Text('EUR €')),
                DropdownMenuItem(value: 'GBP', child: Text('GBP £')),
              ],
              onChanged: (value) => onCurrencyChanged(value ?? 'TRY'),
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Saatlik kazanç'),
              subtitle: const Text('Aylık gelir / (Haftalık saat × 4)'),
              trailing: Text('${hourlyIncome.toStringAsFixed(2)} $currencyCode'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: onSave,
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmotionSummaryCard extends ConsumerWidget {
  const _EmotionSummaryCard({required this.summaryAsync});

  final AsyncValue<AnalysisSummary> summaryAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return summaryAsync.when(
      loading: () => const Card(child: ListTile(title: Text('Duygu verisi yükleniyor...'))),
      error: (error, _) => Card(child: ListTile(title: Text('Duygu verisi alınamadı: $error'))),
      data: (summary) {
        final topEmotion = summary.emotionInsights.sorted((a, b) => b.amount.compareTo(a.amount)).firstOrNull;
        return Card(
          child: ListTile(
            leading: Icon(topEmotion?.mood.icon ?? Icons.insights_outlined, color: topEmotion?.mood.color),
            title: const Text('Duygu Analizi'),
            subtitle: Text(
              topEmotion == null
                  ? 'Hangi duygularla harcama yaptığını takip et'
                  : '${topEmotion.mood.label} harcamaları ${(topEmotion.amount).toStringAsFixed(0)}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => GoRouter.of(context).push('/profile/emotions'),
          ),
        );
      },
    );
  }
}

class _ManagementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Hesapları yönet'),
            onTap: () => context.push('/accounts'),
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: const Text('Kategorileri yönet'),
            onTap: () => context.push('/categories'),
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.file_download_outlined),
            title: const Text('Verileri dışa aktar (JSON)'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('JSON dışa aktarma yakında.')));
            },
          ),
          const Divider(height: 0),
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
  }
}
