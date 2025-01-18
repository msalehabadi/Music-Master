import 'package:spotify_clone/data/model/artist.dart';

abstract class ArtistDatasource {
  Future<List<Artist>> getArtistList();
}

class ArtistLocalDatasource extends ArtistDatasource {
  @override
  Future<List<Artist>> getArtistList() async {
    return [
      Artist(
        "Behnam-Bani.jpg",
        "Behnam Bani",
      ),
      Artist(
        "Ebi.jpg",
        "Ebi",
      ),
      Artist(
        "Metallica.jpg",
        "Metallica",
      ),
      Artist(
        "Mohsen-Yeganeh.jpg",
        "Mohsen-Yeganeh",
      ),
      Artist(
        "Roger-Waters.jpg",
        "Roger-Waters",
      ),
      Artist(
        "ABBA.jpeg",
        "ABBA",
      ),
      Artist(
        "Nirvana.jpeg",
        "Nirvana",
      ),
    ];
  }
}
