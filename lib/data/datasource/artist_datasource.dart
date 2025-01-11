import 'package:spotify_clone/data/model/artist.dart';

abstract class ArtistDatasource {
  Future<List<Artist>> getArtistList();
}

class ArtistLocalDatasource extends ArtistDatasource {
  @override
  Future<List<Artist>> getArtistList() async {
    return [
      Artist(
        "21-Savage.jpg",
        "21 Savage",
      ),
      Artist(
        "Adele.jpg",
        "Adele",
      ),
      Artist(
        "Cardi-B.jpg",
        "Cardi B",
      ),
      Artist(
        "DaBaby.jpg",
        "DaBaby",
      ),
      Artist(
        "Doja-Cat.jpg",
        "Doja Cat",
      ),
      Artist(
        "Drake.jpg",
        "Drake",
      ),
      Artist(
        "Eminem.jpg",
        "Eminem",
      ),
    ];
  }
}
