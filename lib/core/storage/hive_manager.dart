import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/core/enums/account_type.dart';
import 'package:personal_finance_coach/core/enums/category_type.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';
import 'package:personal_finance_coach/core/enums/recurrence_frequency.dart';
import 'package:personal_finance_coach/core/enums/theme_preference.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/categories/domain/entities/category.dart';
import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/recurring_payment.dart';

class HiveManager {
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;

    try {
      await Hive.initFlutter();
    } on MissingPluginException {
      final tempDir = await Directory.systemTemp.createTemp('pfc_hive_test_');
      Hive.init(tempDir.path); // Allows widget tests without platform channels.
    }
    await _registerAdapters();
    await Future.wait([
      Hive.openBox<UserProfile>(AppConstants.hiveProfileBox),
      Hive.openBox<Account>(AppConstants.hiveAccountsBox),
      Hive.openBox<FinanceCategory>(AppConstants.hiveCategoriesBox),
      Hive.openBox<FinanceTransaction>(AppConstants.hiveTransactionsBox),
      Hive.openBox<RecurringPayment>(AppConstants.hiveRecurringPaymentsBox),
    ]);
    _initialized = true;
  }

  static Future<void> _registerAdapters() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserProfileAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(AccountAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(FinanceCategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(FinanceTransactionAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(RecurringPaymentAdapter());
    }
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(MoodAdapter());
    }
    if (!Hive.isAdapterRegistered(11)) {
      Hive.registerAdapter(ThemePreferenceAdapter());
    }
    if (!Hive.isAdapterRegistered(12)) {
      Hive.registerAdapter(CategoryTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(13)) {
      Hive.registerAdapter(AccountTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(14)) {
      Hive.registerAdapter(RecurrenceFrequencyAdapter());
    }
  }
}

