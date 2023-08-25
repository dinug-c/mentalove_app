import 'package:appwrite/appwrite.dart';

import 'appwrite_client.dart';

Databases databases = Databases(client);

Future<void> createData() async {
  try {
    final response = await databases.createDocument(
        databaseId: '64e7ea9ee9e2a25b8303',
        documentId: '[DOCUMENT_ID]',
        collectionId: 'your_collection_id',
        data: {'key': 'value'});
    print('Data created: ${response.data}');
  } catch (e) {
    print('Error creating data: $e');
  }
}

Future<void> listData() async {
  try {
    final response = await databases.listDocuments(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: '[COLLECTION_ID]',
    );
    var result;
    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  } catch (e) {
    print('Error reading data: $e');
  }
}

Future<void> readData() async {
  try {
    final response = await databases.getDocument(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: '[COLLECTION_ID]',
      documentId: '[DOCUMENT_ID]',
    );
    print('Data read: ${response.data}');
  } catch (e) {
    print('Error reading data: $e');
  }
}

Future<void> updateData(String documentId) async {
  try {
    final response = await databases.updateDocument(
        databaseId: '64e7ea9ee9e2a25b8303',
        collectionId: '[COLLECTION_ID]',
        documentId: '[DOCUMENT_ID]',
        data: {'key': 'new_value'});
    print('Data updated: ${response.data}');
  } catch (e) {
    print('Error updating data: $e');
  }
}

Future<void> deleteData(String documentId) async {
  try {
    final response = await databases.deleteDocument(
      databaseId: '64e7ea9ee9e2a25b8303',
      collectionId: '[COLLECTION_ID]',
      documentId: '[DOCUMENT_ID]',
    );
    print('Data deleted: ${response.data}');
  } catch (e) {
    print('Error deleting data: $e');
  }
}
