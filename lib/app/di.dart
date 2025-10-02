import 'package:get_it/get_it.dart';

import '../data/data_source/local_data_source.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/faqs_usecase.dart';
import '../presentation/faqs/faqs_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));
}

void initFaqsModule() {
  if (!GetIt.I.isRegistered<FaqsUseCase>()) {
    instance.registerFactory<FaqsUseCase>(() => FaqsUseCase(instance()));
    instance.registerFactory<FaqsViewModel>(() => FaqsViewModel(instance()));
  }
}
