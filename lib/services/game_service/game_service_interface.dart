import '../base/base_service.dart';

abstract class IGameService extends BaseService {
  Future<int> getUserMoney(String userId);
  Future<int> play(String userId, int bid);
}