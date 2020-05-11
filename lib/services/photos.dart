import '../models/unsplash.dart';
import 'networking.dart';

const clientId = 'U_M0l1VCNv3QUob72KmV-NwUv3-0GGrlg9cvSEn6jPE';
const baseUrl = "https://api.unsplash.com/collections/";

class PhotosModel {
  PhotosModel(this.collectionId);
  final int collectionId;

  Future<Unsplash> getPhotos() async {
    NetworkHelper networkHelper =
        NetworkHelper('$baseUrl' + '$collectionId/photos/?client_id=$clientId');
    var photosData = await networkHelper.getData();
    return photosData;
  }
}
