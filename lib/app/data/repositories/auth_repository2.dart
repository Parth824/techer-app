import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tech_lancer_teacher/app/core/services/storage_service.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/USR/login.dart';
import 'package:tech_lancer_teacher/app/data/models/request_dto/USR/login_req.dart';

import '../../core/constants/urls.dart';
import '../models/request_dto/USR/cmp_register.dart';
import '../networks/api_controller2.dart';
import '../networks/error_handler.dart';
import '../networks/failure.dart';

class AuthRepository2 {
  final ApiController2 apiController;

  AuthRepository2({required this.apiController});

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

  

  Future<Either<Failure, Response>> tecCoures() async {
    try {

      final response = await apiController.get(path: CustomPaths.tecCoures(StorageService.getTecUniqeCode() ?? "") );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
  Future<Either<Failure, Response>> tecEnrolled() async {
    try {
      final response = await apiController.get(path: CustomPaths.tecEnrolled(StorageService.getTecCoureId() ?? "") );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> tecLecture() async {
    try {
      final response = await apiController.get(path: CustomPaths.tecLecture(StorageService.getTecCoureId() ?? "") );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, Response>> usrProfilesData() async {
    try {
      final response = await apiController.get(path: CustomPaths.usrViewProfile);
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
