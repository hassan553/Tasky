import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt/features/auth/data/model/user_model.dart';
import 'package:tt/features/auth/data/repo/profile_repo.dart';

import '../../../profile/data/model/profile_item_model.dart';

part 'profiel_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepo profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  Future getUserProfile() async {
    emit(GetUserProfileLoading());
    var result = await profileRepo.getUserProfile();
    result.fold((error) {
      emit(GetUserProfileError());
    }, (r) {
      userModel = r;
      initValues();
      emit(GetUserProfileSuccess());
    });
  }
  List<ProfileItemModel> profileItems = [];
  initValues() {
    profileItems = [
      ProfileItemModel(title: 'Name', value: userModel?.displayName??''),
      ProfileItemModel(title: 'Phone', value: '0123456789'),
      ProfileItemModel(title: 'Email', value: 'hassan@gmail.com'),
      ProfileItemModel(title: 'Address', value: userModel?.address??""),
      ProfileItemModel(title: 'Level', value: userModel?.level??''),
      ProfileItemModel(title: 'Experience', value:( userModel?.experienceYears??0).toString()),
    ];
  }
}
