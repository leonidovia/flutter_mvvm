import 'package:injectable/injectable.dart';

import '../base/base_service.dart';
import 'game_service_interface.dart';

@LazySingleton(as: IGameService)
class GameService extends BaseService implements IGameService {
  var _money = 1000;

  @override
  Future<int> getUserMoney(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    return _money;
  }

  @override
  Future<int> play(String userId, int bid) async {
    await Future.delayed(Duration(seconds: 1));
    _money += bid * 2;
    return _money;
  }
}
