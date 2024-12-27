abstract class AbstractRepository<T, Y> {
  Future<List<T>> getAllItem();
  Future<Y> getItemById(int id);
}