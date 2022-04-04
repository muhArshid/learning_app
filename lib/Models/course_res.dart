class CourseDetails {
  final bool? status;
  final Data? data;
  final String? message;

  CourseDetails({
    this.status,
    this.data,
    this.message,
  });

  CourseDetails.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() =>
      {'status': status, 'data': data?.toJson(), 'message': message};
}

class Data {
  final int? id;
  final String? title;
  final String? titleSlug;
  final String? teaserVideo;
  final num? totalLessons;
  final num? totalDuration;
  final String? shortDescription;
  final String? offers;
  final String? createdBy;
  final dynamic rating;
  final num? ratingCount;
  final String? actualPrice;
  final String? listingImage;
  final String? price;
  final String? description;
  final String? updatedAt;
  final num? courseValidity;
  final List<LearningNotes>? learningNotes;
  final List<CourseChapter>? courseChapter;
  final List<dynamic>? reviews;
  final PercentageStar? percentageStar;

  Data({
    this.id,
    this.title,
    this.titleSlug,
    this.teaserVideo,
    this.totalLessons,
    this.totalDuration,
    this.shortDescription,
    this.offers,
    this.createdBy,
    this.rating,
    this.ratingCount,
    this.actualPrice,
    this.listingImage,
    this.price,
    this.description,
    this.updatedAt,
    this.courseValidity,
    this.learningNotes,
    this.courseChapter,
    this.reviews,
    this.percentageStar,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        titleSlug = json['title_slug'] as String?,
        teaserVideo = json['teaser_video'] as String?,
        totalLessons = json['total_lessons'] as num?,
        totalDuration = json['total_duration'] as num?,
        shortDescription = json['short_description'] as String?,
        offers = json['offers'] as String?,
        createdBy = json['created_by'] as String?,
        rating = json['rating'],
        ratingCount = json['rating_count'] as num?,
        actualPrice = json['actual_price'] as String?,
        listingImage = json['listing_image'] as String?,
        price = json['price'] as String?,
        description = json['description'] as String?,
        updatedAt = json['updated_at'] as String?,
        courseValidity = json['course_validity'] as num?,
        learningNotes = (json['learning_notes'] as List?)
            ?.map((dynamic e) =>
                LearningNotes.fromJson(e as Map<String, dynamic>))
            .toList(),
        courseChapter = (json['course_chapter'] as List?)
            ?.map((dynamic e) =>
                CourseChapter.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviews = json['reviews'] as List?,
        percentageStar =
            (json['percentage_star'] as Map<String, dynamic>?) != null
                ? PercentageStar.fromJson(
                    json['percentage_star'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'title_slug': titleSlug,
        'teaser_video': teaserVideo,
        'total_lessons': totalLessons,
        'total_duration': totalDuration,
        'short_description': shortDescription,
        'offers': offers,
        'created_by': createdBy,
        'rating': rating,
        'rating_count': ratingCount,
        'actual_price': actualPrice,
        'listing_image': listingImage,
        'price': price,
        'description': description,
        'updated_at': updatedAt,
        'course_validity': courseValidity,
        'learning_notes': learningNotes?.map((e) => e.toJson()).toList(),
        'course_chapter': courseChapter?.map((e) => e.toJson()).toList(),
        'reviews': reviews,
        'percentage_star': percentageStar?.toJson()
      };
}

class LearningNotes {
  final int? id;
  final String? courseName;
  final String? text;
  final bool? isActive;
  final int? course;

  LearningNotes({
    this.id,
    this.courseName,
    this.text,
    this.isActive,
    this.course,
  });

  LearningNotes.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        courseName = json['course_name'] as String?,
        text = json['text'] as String?,
        isActive = json['is_active'] as bool?,
        course = json['course'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'course_name': courseName,
        'text': text,
        'is_active': isActive,
        'course': course
      };
}

class CourseChapter {
  final int? id;
  final String? chapterTitle;
  final String? titleSlug;
  final num? chaptersCount;
  final num? durationCount;
  final List<Chapters>? chapters;

  CourseChapter({
    this.id,
    this.chapterTitle,
    this.titleSlug,
    this.chaptersCount,
    this.durationCount,
    this.chapters,
  });

  CourseChapter.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        chapterTitle = json['chapter_title'] as String?,
        titleSlug = json['title_slug'] as String?,
        chaptersCount = json['chapters_count'] as num?,
        durationCount = json['duration_count'] as num?,
        chapters = (json['chapters'] as List?)
            ?.map((dynamic e) => Chapters.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'chapter_title': chapterTitle,
        'title_slug': titleSlug,
        'chapters_count': chaptersCount,
        'duration_count': durationCount,
        'chapters': chapters?.map((e) => e.toJson()).toList()
      };
}

class Chapters {
  final int? id;
  final String? libraryName;
  final num? duration;
  final String? contentVideo;
  final bool? freeVideo;

  Chapters({
    this.id,
    this.libraryName,
    this.duration,
    this.contentVideo,
    this.freeVideo,
  });

  Chapters.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        libraryName = json['library_name'] as String?,
        duration = json['duration'] as num?,
        contentVideo = json['content_video'] as String?,
        freeVideo = json['free_video'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'library_name': libraryName,
        'duration': duration,
        'content_video': contentVideo,
        'free_video': freeVideo
      };
}

class PercentageStar {
  final String? stars1;
  final String? stars2;
  final String? stars3;
  final String? stars4;
  final String? stars5;

  PercentageStar({
    this.stars1,
    this.stars2,
    this.stars3,
    this.stars4,
    this.stars5,
  });

  PercentageStar.fromJson(Map<String, dynamic> json)
      : stars1 = json['1stars'] as String?,
        stars2 = json['2stars'] as String?,
        stars3 = json['3stars'] as String?,
        stars4 = json['4stars'] as String?,
        stars5 = json['5stars'] as String?;

  Map<String, dynamic> toJson() => {
        '1stars': stars1,
        '2stars': stars2,
        '3stars': stars3,
        '4stars': stars4,
        '5stars': stars5
      };
}
