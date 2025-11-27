import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/accounts/presentation/pages/accounts_screen.dart';
import '../../features/analysis/presentation/pages/analysis_screen.dart';
import '../../features/categories/presentation/pages/categories_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/home/presentation/pages/home_shell.dart';
import '../../features/profile/presentation/pages/emotion_analysis_page.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../../features/settings/presentation/pages/settings_screen.dart';
import '../../features/transactions/presentation/pages/add_transaction_screen.dart';
import '../../features/transactions/presentation/pages/transaction_detail_screen.dart';
import '../../features/transactions/presentation/pages/transactions_screen.dart';

enum AppRoute {
  home,
  analysis,
  transactions,
  profile,
  addTransaction,
  transactionDetail,
  accounts,
  categories,
  settings,
  emotionAnalysis,
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/home',
              name: AppRoute.home.name,
              pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/analysis',
              name: AppRoute.analysis.name,
              pageBuilder: (context, state) => const NoTransitionPage(child: AnalysisScreen()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/transactions',
              name: AppRoute.transactions.name,
              pageBuilder: (context, state) => const NoTransitionPage(child: TransactionsScreen()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/profile',
              name: AppRoute.profile.name,
              pageBuilder: (context, state) => const NoTransitionPage(child: ProfileScreen()),
            ),
          ]),
        ],
      ),
      GoRoute(
        path: '/transactions/new',
        name: AppRoute.addTransaction.name,
        builder: (context, state) {
          final type = state.uri.queryParameters['type'];
          return AddTransactionScreen(initialIsIncome: type == 'income');
        },
      ),
      GoRoute(
        path: '/transactions/:id',
        name: AppRoute.transactionDetail.name,
        builder: (context, state) => TransactionDetailScreen(transactionId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/accounts',
        name: AppRoute.accounts.name,
        builder: (context, state) => const AccountsScreen(),
      ),
      GoRoute(
        path: '/categories',
        name: AppRoute.categories.name,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: AppRoute.settings.name,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/profile/emotions',
        name: AppRoute.emotionAnalysis.name,
        builder: (context, state) => const EmotionAnalysisPage(),
      ),
    ],
  );
});

