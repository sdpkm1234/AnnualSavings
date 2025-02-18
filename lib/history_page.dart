import 'package:annual_savings/savings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Transaction History', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple, // Changed AppBar color
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(height: 4.0, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SavingsCubit, Map<String, dynamic>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state['history'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.fiber_manual_record,
                      size: 12, color: Colors.teal),
                  title: Text(state['history'][index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
