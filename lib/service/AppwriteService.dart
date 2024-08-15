import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  late Client client;
  late Databases databases;

  AppwriteService() {
    client = Client()
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("66aa401e00292e7bdae6")
        .setSelfSigned(status: true);

    databases = Databases(client);
  }

  Future<List<Document>> fetchDocuments(
      String databaseId, String collectionId) async {
    try {
      final result = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
      );
      return result.documents;
    } catch (e) {
      throw Exception('Failed to get documents: $e');
    }
  }
}
