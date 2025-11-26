import 'package:flutter/material.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';
import 'package:personal_finance_coach/core/extensions/date_extensions.dart';
import 'package:personal_finance_coach/core/utils/currency_formatter.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    required this.currencyCode,
    this.onTap,
  });

  final FinanceTransaction transaction;
  final String currencyCode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyFormatter(currencyCode);
    final amountText = '${transaction.isIncome ? '+' : '-'}${formatter.format(transaction.amount)}';
    final mood = transaction.mood;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: mood.color.withValues(alpha: 0.15),
          child: Icon(mood.icon, color: mood.color),
        ),
        title: Text(transaction.title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text('${transaction.date.shortDayMonth} • ${mood.label}'),
        trailing: Text(
          amountText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: transaction.isIncome ? Colors.green : Colors.red,
              ),
        ),
      ),
    );
  }
}

