import 'package:isar/isar.dart';
import 'package:my_music/Data/Localization/Entities/login_Entity.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [LoginEntitiesSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<void> insertCategory(LoginEntities newUser) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.loginEntities.putSync(newUser));
  }

/*  Future<void> insertCategory(Categories newCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categories.putSync(newCategory));
  }

  Future<void> updateCategory(int oldCategoryId, String newCategory) async {
    final isar = await db;
    final catData = await isar.categories.get(oldCategoryId);
    catData?.categoryName = newCategory;
    isar.writeTxnSync<int>(() => isar.categories.putSync(catData!));
  }

  Future<void> deleteCategory(int categoryId) async {
    final isar = await db;
    await isar.writeTxn(() async {
 await isar.categories.delete(categoryId);
      // print('Recipe deleted: $success');
    });
  }

  Future<List<Categories>> getAllCategories() async {
    final isar = await db;
    return await isar.categories.where().findAll();
  }

  Stream<List<Categories>> listenToCategories() async* {
    final isar = await db;
    yield* isar.categories.where().watch(fireImmediately: true);
  }*/
}
