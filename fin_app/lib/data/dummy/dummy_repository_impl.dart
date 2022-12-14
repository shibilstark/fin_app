import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fin_app/core/collections.dart';
import 'package:fin_app/core/dummy_data.dart';
import 'package:fin_app/domain/dummy/model/dummy_model.dart';
import 'package:dartz/dartz.dart';
import 'package:fin_app/domain/dummy/repository/dummy_repository.dart';
import 'package:fin_app/domain/failures/failures.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DummyRepository)
class DummyRepositoryImpl implements DummyRepository {
  @override
  Future<Either<List<DummyModel>, AppFailure>> getAllDummyData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(FireStoreCollectionKeys.dummyData)
          .get();

      final dummyDatas =
          doc.docs.map((e) => DummyModel.fromMap(e.data())).toList();

      return Left(dummyDatas);
    } catch (e) {
      return Right(AppFailure(e.toString()));
    }
  }

  Future<Either<bool, AppFailure>> saveDummyData() async {
    try {
      final doc = FirebaseFirestore.instance
          .collection(FireStoreCollectionKeys.dummyData);

      dummyDatas.forEach((element) async {
        await doc.doc(element.id).set(element.toMap());
      });

      return const Left(true);
    } catch (e) {
      return Right(AppFailure(e.toString()));
    }
  }
}
