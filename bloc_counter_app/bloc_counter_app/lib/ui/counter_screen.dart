import 'package:bloc_counter_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_app/bloc/counter/counter_events.dart';
import 'package:bloc_counter_app/bloc/counter/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('main build');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context,state){
                print('value build');
                return   Text(state.value.toString());
              },
       ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {

                  print('IncrementCounter build');
                  context.read<CounterBloc>().add(IncrementCounter());
                }, child: const Text('+')),
                ElevatedButton(onPressed: () {

                  print('DecrementCounter build');
                  context.read<CounterBloc>().add(DecrementCounter());
                }, child: const Text('-'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
