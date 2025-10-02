import 'package:dartz/dartz.dart';
import 'package:hitster/data/failure.dart';
import 'package:hitster/domain/model/faqs.dart';

abstract class Repository {
  Future<Either<Failure, FAQS>> getFaqs();
}
