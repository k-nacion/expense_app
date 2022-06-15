abstract class Usecase<ReturnType, ParamType> {
  const Usecase();

  Future<ReturnType> call([ParamType? param]);
}
