import 'package:spendee/data/1.dart';

List<money> geter_top() {
  money snap_food = money();
  snap_food.image = 'ph_money-fill.png';
  snap_food.name = 'food';
  snap_food.time = 'jan 30';
  snap_food.fee = '20';
  snap_food.buy = true;
  return [snap_food];
}
