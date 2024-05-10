import 'package:equatable/equatable.dart';
import 'package:todo/features/profiles/models/profile.model.dart';

abstract class ProfileState extends Equatable {
  final List<ProfileModel> profiles;

  const ProfileState({
    required this.profiles,
  });

  @override
  List<Object> get props => [profiles];
}
