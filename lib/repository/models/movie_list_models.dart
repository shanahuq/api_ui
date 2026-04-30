
class Movielist {
    String? id;
    String? url;
    String? primaryTitle;
    String? originalTitle;
    String? type;
    List<Thumbnails>? thumbnails;
    bool? isAdult;
    String? releaseDate;
    int? startYear;
    List<String>? genres;
    List<String>? interests;
    List<String>? countriesOfOrigin;
    List<String>? spokenLanguages;
    List<dynamic>? productionCompanies;
    String? description;
    String? primaryImage;
    double? averageRating;
    int? numVotes;
    String? contentRating;
    int? runtimeMinutes;
    List<String>? filmingLocations;
    int? metascore;
    String? trailer;
    List<String>? externalLinks;
    int? endYear;
    int? grossWorldwide;
    int? budget;

    Movielist({this.id, this.url, this.primaryTitle, this.originalTitle, this.type, this.thumbnails, this.isAdult, this.releaseDate, this.startYear, this.genres, this.interests, this.countriesOfOrigin, this.spokenLanguages, this.productionCompanies, this.description, this.primaryImage, this.averageRating, this.numVotes, this.contentRating, this.runtimeMinutes, this.filmingLocations, this.metascore, this.trailer, this.externalLinks, this.endYear, this.grossWorldwide, this.budget});

    Movielist.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        url = json["url"];
        primaryTitle = json["primaryTitle"];
        originalTitle = json["originalTitle"];
        type = json["type"];
        thumbnails = json["thumbnails"] == null ? null : (json["thumbnails"] as List).map((e) => Thumbnails.fromJson(e)).toList();
        isAdult = json["isAdult"];
        releaseDate = json["releaseDate"];
        startYear = json["startYear"];
        genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
        interests = json["interests"] == null ? null : List<String>.from(json["interests"]);
        countriesOfOrigin = json["countriesOfOrigin"] == null ? null : List<String>.from(json["countriesOfOrigin"]);
        spokenLanguages = json["spokenLanguages"] == null ? null : List<String>.from(json["spokenLanguages"]);
        productionCompanies = json["productionCompanies"] ?? [];
        description = json["description"];
        primaryImage = json["primaryImage"];
        averageRating = json["averageRating"];
        numVotes = json["numVotes"];
        contentRating = json["contentRating"];
        runtimeMinutes = json["runtimeMinutes"];
        filmingLocations = json["filmingLocations"] == null ? null : List<String>.from(json["filmingLocations"]);
        metascore = json["metascore"];
        trailer = json["trailer"];
        externalLinks = json["externalLinks"] == null ? null : List<String>.from(json["externalLinks"]);
        endYear = json["endYear"];
        grossWorldwide = json["grossWorldwide"];
        budget = json["budget"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["url"] = url;
        _data["primaryTitle"] = primaryTitle;
        _data["originalTitle"] = originalTitle;
        _data["type"] = type;
        if(thumbnails != null) {
            _data["thumbnails"] = thumbnails?.map((e) => e.toJson()).toList();
        }
        _data["isAdult"] = isAdult;
        _data["releaseDate"] = releaseDate;
        _data["startYear"] = startYear;
        if(genres != null) {
            _data["genres"] = genres;
        }
        if(interests != null) {
            _data["interests"] = interests;
        }
        if(countriesOfOrigin != null) {
            _data["countriesOfOrigin"] = countriesOfOrigin;
        }
        if(spokenLanguages != null) {
            _data["spokenLanguages"] = spokenLanguages;
        }
        if(productionCompanies != null) {
            _data["productionCompanies"] = productionCompanies;
        }
        _data["description"] = description;
        _data["primaryImage"] = primaryImage;
        _data["averageRating"] = averageRating;
        _data["numVotes"] = numVotes;
        _data["contentRating"] = contentRating;
        _data["runtimeMinutes"] = runtimeMinutes;
        if(filmingLocations != null) {
            _data["filmingLocations"] = filmingLocations;
        }
        _data["metascore"] = metascore;
        _data["trailer"] = trailer;
        if(externalLinks != null) {
            _data["externalLinks"] = externalLinks;
        }
        _data["endYear"] = endYear;
        _data["grossWorldwide"] = grossWorldwide;
        _data["budget"] = budget;
        return _data;
    }
}

class Thumbnails {
    String? url;
    int? width;
    int? height;

    Thumbnails({this.url, this.width, this.height});

    Thumbnails.fromJson(Map<String, dynamic> json) {
        url = json["url"];
        width = json["width"];
        height = json["height"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }
}