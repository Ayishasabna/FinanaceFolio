import 'package:flutter/material.dart';
import 'package:spendee/data/1.dart';

List<money> geter() {
  money salary = money();
  salary.name = 'salary';
  salary.time = 'today';
  salary.fee = '+300';
  salary.buy = false;
  salary.image = 'ph_money-fill.png';

  money Health = money();
  Health.name = 'Health';
  Health.time = 'today';
  Health.fee = '+300';
  Health.buy = true;
  Health.image = 'Vector (1).png';

  return [salary, Health];
}
