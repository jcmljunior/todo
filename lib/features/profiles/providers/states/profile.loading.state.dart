import 'package:todo/features/profiles/models/profile.model.dart';
import 'package:todo/features/profiles/providers/states/profile.state.dart';

class ProfileLoading extends ProfileState {
  ProfileLoading()
      : super(
          profiles: [
            const ProfileModel(
              name: 'Anonymous User',
            ),
          ],
        );
}
