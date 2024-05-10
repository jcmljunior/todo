import 'package:flutter/widgets.dart';
import 'package:todo/features/profiles/providers/stores/profile.store.dart';
import 'package:todo/features/profiles/services/profile.service.dart';

class ProfileContainer extends InheritedWidget {
  final ProfileService profileService;
  final ProfileStore profileStore;

  const ProfileContainer({
    super.key,
    required super.child,
    required this.profileService,
    required this.profileStore,
  });

  @override
  bool updateShouldNotify(covariant ProfileContainer oldWidget) {
    return true;
  }

  static ProfileContainer of(BuildContext context, {bool listen = true}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<ProfileContainer>()!
        : context.findAncestorWidgetOfExactType<ProfileContainer>()!;
  }

  static ProfileContainer read(BuildContext context) {
    return ProfileContainer.of(context, listen: false);
  }

  static ProfileContainer watch(BuildContext context) {
    return ProfileContainer.of(context, listen: true);
  }
}
