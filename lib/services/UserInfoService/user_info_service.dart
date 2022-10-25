import 'package:flutter_mvvm/models/domain/user/user_info.dart';
import 'package:flutter_mvvm/services/UserInfoService/user_info_service_interface.dart';
import 'package:flutter_mvvm/services/base/base_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserInfoService)
class UserInfoService extends BaseService implements IUserInfoService {
  @override
  final userInfo = UserInfo('123', 'Vasya', 'Pupkin');
}
