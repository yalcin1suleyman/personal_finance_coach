import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/core/enums/theme_preference.dart';
import 'package:personal_finance_coach/core/router/app_router.dart';
import 'package:personal_finance_coach/core/storage/hive_manager.dart';
import 'package:personal_finance_coach/core/theme/app_theme.dart';
import 'package:personal_finance_coach/core/services/notification_service.dart';
import 'package:personal_finance_coach/features/profile/presentation/providers/profile_providers.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'tr_TR';
  await initializeDateFormatting(Intl.defaultLocale, null);
  debugPrint('[Init] HiveManager initialization started');
  await HiveManager.init();
  debugPrint('[Init] HiveManager initialization completed');
  debugPrint('[Init] NotificationService initialization started');
  await NotificationService().init();
  debugPrint('[Init] NotificationService initialization completed');
  runApp(const ProviderScope(child: PersonalFinanceCoachApp()));
}

class PersonalFinanceCoachApp extends ConsumerWidget {
  const PersonalFinanceCoachApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final profileAsync = ref.watch(profileStreamProvider);

    ThemeMode themeMode = ThemeMode.system;
    profileAsync.whenData((profile) {
      themeMode = switch (profile.themePreference) {
        ThemePreference.light => ThemeMode.light,
        ThemePreference.dark => ThemeMode.dark,
        ThemePreference.system => ThemeMode.system,
      };
    });

    return MaterialApp.router(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
