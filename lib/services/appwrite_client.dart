import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('64c47100ba9e234fe300')
    .setSelfSigned(status: true);

Account account = Account(client);
