import 'package:appwrite/appwrite.dart';

import 'appwrite_client.dart';

Databases databases = Databases(client);

Future<dynamic> createData(
    Map<String, dynamic> dataList, String collectionID) async {
  try {
    final response = await databases.createDocument(
        databaseId: '64e7ea9ee9e2a25b8303',
        documentId: ID.unique(),
        collectionId: collectionID,
        data: dataList);
    return response;
  } catch (e) {
    return e;
  }
}

Future<dynamic> listDocuments(String collectionID) async {
  try {
    final response = await databases.listDocuments(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: collectionID,
    );
    return response.documents;
  } catch (e) {
    return e;
  }
}

Future<dynamic> readData(String docId, String collectionID) async {
  try {
    final response = await databases.getDocument(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: collectionID,
      documentId: docId,
    );
    return response.data;
  } catch (e) {
    return e;
  }
}

Future<dynamic> updateData(
    String docId, Map<String, dynamic> dataUpdate, String collectionID) async {
  try {
    final response = await databases.updateDocument(
        databaseId: '64e7ea9ee9e2a25b8303',
        collectionId: collectionID,
        documentId: docId,
        data: dataUpdate);
    return response.data;
  } catch (e) {
    return e;
  }
}

Future<dynamic> deleteData(String documentId, String collectionID) async {
  try {
    final response = await databases.deleteDocument(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: collectionID,
      documentId: documentId,
    );
    return response.data;
  } catch (e) {
    return e;
  }
}
