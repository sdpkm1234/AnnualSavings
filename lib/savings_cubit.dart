import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class SavingsCubit extends Cubit<Map<String, dynamic>> {
  final Box savingsBox;

  SavingsCubit(this.savingsBox)
      : super({
          'compA': savingsBox.get('compA', defaultValue: 0.0),
          'compB': savingsBox.get('compB', defaultValue: 0.0),
          'totalSavings': savingsBox.get('totalSavings', defaultValue: 0.0),
          'history': savingsBox.get('history', defaultValue: []).cast<String>(),
        });

  void addSavings(double amount) {
    if (amount > 0) {
      state['compA'] += amount * 0.6;
      state['compB'] += amount * 0.4;
      state['totalSavings'] += amount;
      state['history'].add('Added: \$${amount.toStringAsFixed(2)}');
      _saveData();
    }
  }

  void withdrawSavings(String component, double amount) {
    if (amount > 0 && state[component] >= amount) {
      state[component] -= amount;
      state['history']
          .add('Withdrawn from $component: \$${amount.toStringAsFixed(2)}');
      _saveData();
    }
  }

  void _saveData() {
    savingsBox.put('compA', state['compA']);
    savingsBox.put('compB', state['compB']);
    savingsBox.put('totalSavings', state['totalSavings']);
    savingsBox.put('history', state['history']);
    emit(Map.from(state));
  }
}
