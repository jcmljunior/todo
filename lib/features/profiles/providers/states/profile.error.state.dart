import 'package:todo/features/profiles/models/profile.model.dart';
import 'package:todo/features/profiles/providers/states/profile.state.dart';

class ProfileError extends ProfileState {
  final String message;

  ProfileError({
    required this.message,
  }) : super(
          profiles: [
            const ProfileModel(
              name: 'Anonymous User',
            ),
          ],
        );

  @override
  List<Object> get props => [message];
}
