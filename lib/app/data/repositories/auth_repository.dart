
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/TECHER/startLect_tec_req.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/USR/login.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/USR/login_req.dart';
import 'package:tech_lancer_teacher/app/data/networks/api_controller.dart';

import '../../core/constants/urls.dart';
import '../models/request_dto/USR/cmp_register.dart';
import '../networks/error_handler.dart';
import '../networks/failure.dart';

class AuthRepository {
  final ApiController apiController;

  AuthRepository({required this.apiController});

  /// USER
  /// MARK: Login
  Future<Either<Failure, Response>> userLogin(
      {required LoginRequestModel requestDTO}) async {
    try {
      final response = await apiController.post(
        path: CustomPaths.usrLogin,
        data: requestDTO.toMap(),
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecLogin(
      {required LoginRequestDto requestDTO}) async {
    try {
      final response = await apiController.post(
        path: CustomPaths.TecLogin,
        data: requestDTO.toMap(),
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecAssignment(
       {required FormData formData}) async {
    try {
      final response = await apiController.postWithFile(
        path: CustomPaths.tecAssignment(StorageService.getTecCoureId() ?? ""),
        data: formData,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
  Future<Either<Failure, Response>> tecAssignmentUpdate(
       {required FormData formData, required String id}) async {
    try {
      final response = await apiController.putWithFile(
        path: CustomPaths.tecAssignmentUpdate(id),
        data: formData,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecVideoInsert(
       {required FormData formData}) async {
    try {
      final response = await apiController.postWithFile(
        path: CustomPaths.tecVideoAdd(StorageService.getTecCoureId() ?? ""),
        data: formData,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecVideoUpdate(
       {required FormData formData,required String Id}) async {
    try {
      final response = await apiController.putWithFile(
        path: CustomPaths.tecVideoUpdate(Id),
        data: formData,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecStartLec(
      {required  StartLectRequestDto requestDTO}) async {
    try {
      final response = await apiController.get2(
        path: CustomPaths.tecStartLec,
        data: requestDTO.toMap(),
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecCoures() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.tecCoures(StorageService.getTecUniqeCode() ?? ""));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecGruop() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.tecGroup(StorageService.getTecId() ?? ""));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecViewGruop() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.ChatViewGroup(StorageService.getTecGroupId() ?? ""));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecAssignmentGet() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.tecAssignmentGet);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecAssignmentDelete({required String id}) async {
    try {
      final response = await apiController.delete(
          path: CustomPaths.tecAssignmentDelete(id));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }


  Future<Either<Failure, Response>> tecVideoDelete({required String id}) async {
    try {
      final response = await apiController.delete(
          path: CustomPaths.tecVideoDelete(id));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }


  
  Future<Either<Failure, Response>> tecVideo() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.tecVideo);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
  Future<Either<Failure, Response>> tecEnrolled() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.tecEnrolled(StorageService.getTecCoureId() ?? ""));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecLecture() async {
    try {
      final response = await apiController.get(
          path: CustomPaths.tecLecture(StorageService.getTecCoureId() ?? ""));
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> usrProfilesData() async {
    try {
      final response =
          await apiController.get(path: CustomPaths.usrViewProfile);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  /// COMPANY

  /// MARK: Login
  Future<Either<Failure, Response>> cmpLogin(
      {required LoginRequestModel requestDTO}) async {
    try {
      final response = await apiController.post(
        path: CustomPaths.cmpLogin,
        data: requestDTO.toMap(),
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> cmpRegister(
      {required CmpRegisterReqModel requestDTO}) async {
    try {
      final response = await apiController.post(
        path: CustomPaths.cmpRegistration,
        data: requestDTO.toMap(),
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> viewAllJobDetails() async {
    try {
      final response = await apiController.get(
        path: CustomPaths.allJobDetails,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> viewAllInternShipDetails() async {
    try {
      final response = await apiController.get(
        path: CustomPaths.allInternDetails,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
