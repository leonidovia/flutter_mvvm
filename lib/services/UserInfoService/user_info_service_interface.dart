import '../../models/domain/user/user_info.dart';
import '../base/base_service.dart';

abstract class IUserInfoService extends BaseService {
  UserInfo get userInfo;
}