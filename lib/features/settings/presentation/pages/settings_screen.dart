import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enums/theme_preference.dart';
import '../../../profile/presentation/providers/profile_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Ayarlar')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Ayarlar yüklenemedi: $error')),
        data: (profile) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Tema', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            // Theme controls moved here to keep the profile page lightweight.
            SegmentedButton<ThemePreference>(
              segments: ThemePreference.values
                  .map((pref) => ButtonSegment(value: pref, label: Text(pref.label)))
                  .toList(),
              selected: {profile.themePreference},
              onSelectionChanged: (value) async {
                final updated = profile.copyWith(themePreference: value.first);
                await ref.read(profileControllerProvider).save(updated);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tema güncellendi')));
              },
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications_active_outlined),
                title: const Text('Bildirimler'),
                subtitle: const Text('Yakında burada özelleştirilebilecek'),
                trailing: const Icon(Icons.lock_clock),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

