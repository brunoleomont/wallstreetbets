import 'package:wallstreetbets/app/data/provider/api.dart';

class PostRepository {
  final MyApiClient apiClient;

  PostRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }
}
