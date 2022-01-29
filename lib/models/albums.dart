class Albums {
  final int? resultCount;
  final List<Album>? results;

  Albums({
    this.resultCount,
    this.results,
  });

  Albums.fromJson(Map<String, dynamic> json)
      : resultCount = json['resultCount'] as int?,
        results = (json['results'] as List?)
            ?.map((dynamic e) => Album.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'resultCount': resultCount,
        'results': results?.map((e) => e.toJson()).toList()
      };
}

class Album {
  final String? wrapperType;
  final String? artistType;
  final String? artistName;
  final String? artistLinkUrl;
  final int? artistId;
  final int? amgArtistId;
  final String? primaryGenreName;
  final int? primaryGenreId;

  Album({
    this.wrapperType,
    this.artistType,
    this.artistName,
    this.artistLinkUrl,
    this.artistId,
    this.amgArtistId,
    this.primaryGenreName,
    this.primaryGenreId,
  });

  Album.fromJson(Map<String, dynamic> json)
      : wrapperType = json['wrapperType'] as String?,
        artistType = json['artistType'] as String?,
        artistName = json['artistName'] as String?,
        artistLinkUrl = json['artistLinkUrl'] as String?,
        artistId = json['artistId'] as int?,
        amgArtistId = json['amgArtistId'] as int?,
        primaryGenreName = json['primaryGenreName'] as String?,
        primaryGenreId = json['primaryGenreId'] as int?;

  Map<String, dynamic> toJson() => {
        'wrapperType': wrapperType,
        'artistType': artistType,
        'artistName': artistName,
        'artistLinkUrl': artistLinkUrl,
        'artistId': artistId,
        'amgArtistId': amgArtistId,
        'primaryGenreName': primaryGenreName,
        'primaryGenreId': primaryGenreId
      };
}
