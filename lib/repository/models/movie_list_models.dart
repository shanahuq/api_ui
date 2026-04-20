
class MovieListModel {
    String? id;
    String? url;
    String? primaryTitle;
    String? originalTitle;
    String? type;
    String? description;
    String? primaryImage;
    List<Thumbnails>? thumbnails;
    bool? isAdult;
    String? releaseDate;
    int? startYear;
    int? runtimeMinutes;
    List<String>? genres;
    List<String>? interests;
    List<String>? countriesOfOrigin;
    List<String>? spokenLanguages;
    List<String>? filmingLocations;
    List<ProductionCompanies>? productionCompanies;
    double? averageRating;
    int? numVotes;
    int? metascore;
    String? contentRating;
    String? trailer;
    int? endYear;
    List<String>? externalLinks;
    int? grossWorldwide;
    int? budget;

    MovieListModel({this.id, this.url, this.primaryTitle, this.originalTitle, this.type, this.description, this.primaryImage, this.thumbnails, this.isAdult, this.releaseDate, this.startYear, this.runtimeMinutes, this.genres, this.interests, this.countriesOfOrigin, this.spokenLanguages, this.filmingLocations, this.productionCompanies, this.averageRating, this.numVotes, this.metascore, this.contentRating, this.trailer, this.endYear, this.externalLinks, this.grossWorldwide, this.budget});

    MovieListModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        url = json["url"];
        primaryTitle = json["primaryTitle"];
        originalTitle = json["originalTitle"];
        type = json["type"];
        description = json["description"];
        primaryImage = json["primaryImage"];
        thumbnails = json["thumbnails"] == null ? null : (json["thumbnails"] as List).map((e) => Thumbnails.fromJson(e)).toList();
        isAdult = json["isAdult"];
        releaseDate = json["releaseDate"];
        startYear = json["startYear"];
        runtimeMinutes = json["runtimeMinutes"];
        genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
        interests = json["interests"] == null ? null : List<String>.from(json["interests"]);
        countriesOfOrigin = json["countriesOfOrigin"] == null ? null : List<String>.from(json["countriesOfOrigin"]);
        spokenLanguages = json["spokenLanguages"] == null ? null : List<String>.from(json["spokenLanguages"]);
        filmingLocations = json["filmingLocations"] == null ? null : List<String>.from(json["filmingLocations"]);
        productionCompanies = json["productionCompanies"] == null ? null : (json["productionCompanies"] as List).map((e) => ProductionCompanies.fromJson(e)).toList();
        averageRating = json["averageRating"];
        numVotes = json["numVotes"];
        metascore = json["metascore"];
        contentRating = json["contentRating"];
        trailer = json["trailer"];
        endYear = json["endYear"];
        externalLinks = json["externalLinks"] == null ? null : List<String>.from(json["externalLinks"]);
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
        _data["description"] = description;
        _data["primaryImage"] = primaryImage;
        if(thumbnails != null) {
            _data["thumbnails"] = thumbnails?.map((e) => e.toJson()).toList();
        }
        _data["isAdult"] = isAdult;
        _data["releaseDate"] = releaseDate;
        _data["startYear"] = startYear;
        _data["runtimeMinutes"] = runtimeMinutes;
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
        if(filmingLocations != null) {
            _data["filmingLocations"] = filmingLocations;
        }
        if(productionCompanies != null) {
            _data["productionCompanies"] = productionCompanies?.map((e) => e.toJson()).toList();
        }
        _data["averageRating"] = averageRating;
        _data["numVotes"] = numVotes;
        _data["metascore"] = metascore;
        _data["contentRating"] = contentRating;
        _data["trailer"] = trailer;
        _data["endYear"] = endYear;
        if(externalLinks != null) {
            _data["externalLinks"] = externalLinks;
        }
        _data["grossWorldwide"] = grossWorldwide;
        _data["budget"] = budget;
        return _data;
    }
}

class ProductionCompanies {
    String? id;
    String? name;

    ProductionCompanies({this.id, this.name});

    ProductionCompanies.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
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