import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubits/counter_cubit.dart';
import 'package:test_api/test_api.dart';

void main() {
  blocTest<CounterCubit, int>(
    'It should increment counter',
    build: () => CounterCubit(),
    act: (cubit) => cubit.increment(),
    expect: () => [1],
  );

  blocTest<CounterCubit, int>(
    'It should increment counter when initial value is 6',
    build: () => CounterCubit(),
    seed: () => 6,
    act: (cubit) => cubit.increment(),
    expect: () => [7],
  );
}
