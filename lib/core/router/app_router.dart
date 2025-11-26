import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_finance_coach/features/accounts/presentation/pages/accounts_screen.dart';
import 'package:personal_finance_coach/features/analysis/presentation/pages/analysis_screen.dart';
import 'package:personal_finance_coach/features/categories/presentation/pages/categories_screen.dart';
import 'package:personal_finance_coach/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:personal_finance_coach/features/dashboard/presentation/pages/home_shell.dart';
import 'package:personal_finance_coach/features/profile/presentation/pages/profile_screen.dart';
import 'package:personal_finance_coach/features/transactions/presentation/pages/add_transaction_screen.dart';
import 'package:personal_finance_coach/features/transactions/presentation/pages/transaction_detail_screen.dart';

enum AppRoute {
  dashboard,
  analysis,
  profile,
  addTransaction,
  transactionDetail,
  accounts,
  categories,
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/dashboard',
              name: AppRoute.dashboard.name,
              pageBuilder: (context, state) => const NoTransitionPage(child: DashboardScreen()),
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
    ],
  );
});

