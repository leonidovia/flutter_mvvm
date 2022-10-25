import '../../models/domain/user/user_info.dart';
import '../user_info_service/user_info_service_interface.dart';
import '../base/base_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserInfoService)
class UserInfoService extends BaseService implements IUserInfoService {
  @override
  final userInfo = UserInfo('123', 'Vasya', 'Pupkin');
}
