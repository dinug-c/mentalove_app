import 'package:appwrite/appwrite.dart';

import 'appwrite_client.dart';

Databases databases = Databases(client);

Future<dynamic> createData(String idDoc, Map<String, dynamic> dataList) async {
  try {
    final response = await databases.createDocument(
        databaseId: '64e7ea9ee9e2a25b8303',
        documentId: ID.unique(),
        collectionId: '64e9f1ed459fee6bacd8',
        data: dataList);
    return response;
  } catch (e) {
    return e;
  }
}

Future<dynamic> listDocuments() async {
  try {
    final response = await databases.listDocuments(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: '64e9f1ed459fee6bacd8',
    );
    return response.documents;
  } catch (e) {
    return e;
  }
}

Future<dynamic> readData(String docId) async {
  try {
    final response = await databases.getDocument(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: '64e9f1ed459fee6bacd8',
      documentId: docId,
    );
    return response.data;
  } catch (e) {
    return e;
  }
}

Future<dynamic> updateData(
    String docId, Map<String, dynamic> dataUpdate) async {
  try {
    final response = await databases.updateDocument(
        databaseId: '64e7ea9ee9e2a25b8303',
        collectionId: '64e9f1ed459fee6bacd8',
        documentId: docId,
        data: dataUpdate);
    return response.data;
  } catch (e) {
    return e;
  }
}

Future<dynamic> deleteData(String documentId) async {
  try {
    final response = await databases.deleteDocument(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: '64e9f1ed459fee6bacd8',
      documentId: documentId,
    );
    return response.data;
  } catch (e) {
    return e;
  }
}
