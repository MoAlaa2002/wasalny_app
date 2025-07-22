import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:wasalny_app/features/auth/data/repo/register_repo_imple.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<RegisterRepoImple>(
    RegisterRepoImple(firebaseAuth: FirebaseAuth.instance),
  );
  // getIt.registerSingleton<RegisterCubit>(
  //   RegisterCubit(registerRepoImple: getIt<RegisterRepoImple>()),
  // );
}
