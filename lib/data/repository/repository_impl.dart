import 'package:dartz/dartz.dart';

import 'package:hitster/data/failure.dart';
import 'package:hitster/domain/model/faqs.dart';

import '../../domain/repository/repository.dart';
import '../../presentation/resource/assets_manager.dart';
import '../data_source/local_data_source.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource _localDataSource;
  RepositoryImpl(this._localDataSource);
  @override
  Future<Either<Failure, FAQS>> getFaqs() async {
    try {
      final response = await _localDataSource.getDataFromJson(JsonAssets.faqs);
      return Right(FAQS.fromJson(response));
    } on Exception catch (e) {
      return Left(Failure(0, e.toString()));
    }
  }
}
