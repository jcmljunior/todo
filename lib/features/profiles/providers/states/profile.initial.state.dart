import 'package:todo/features/profiles/models/profile.model.dart';
import 'package:todo/features/profiles/providers/states/profile.state.dart';

class ProfileInitial extends ProfileState {
  ProfileInitial()
      : super(
          profiles: [
            const ProfileModel(
              name: 'Anonymous User',
            ),
          ],
        );
}
