import 'package:bloc_test/bloc_test.dart';
import 'package:state_management/cubits/counter_cubit.dart';

void main() {
  blocTest<CounterCubit, int>(
    'It should increment counter',
    build: () => CounterCubit(),
    act: (cubit) => cubit.increment(),
    expect: [1],
  );

  blocTest<CounterCubit, int>(
    'It should increment counter when initial value is 6',
    build: () => CounterCubit(),
    seed: 6,
    act: (cubit) => cubit.increment(),
    expect: [7],
  );
}
