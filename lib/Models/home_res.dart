class HomeDetails {
  final int? statusCode;
  final bool? status;
  final Banner? banner;
  final List<HorizontalSlider>? horizontalSlider;
  final String? message;

  HomeDetails({
    this.statusCode,
    this.status,
    this.banner,
    this.horizontalSlider,
    this.message,
  });

  HomeDetails.fromJson(Map<String, dynamic> json)
      : statusCode = json['status_code'] as int?,
        status = json['status'] as bool?,
        banner = (json['banner'] as Map<String, dynamic>?) != null
            ? Banner.fromJson(json['banner'] as Map<String, dynamic>)
            : null,
        horizontalSlider = (json['horizontal_slider'] as List?)
            ?.map((dynamic e) =>
                HorizontalSlider.fromJson(e as Map<String, dynamic>))
            .toList(),
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'status': status,
        'banner': banner?.toJson(),
        'horizontal_slider': horizontalSlider?.map((e) => e.toJson()).toList(),
        'message': message
      };
}

class Banner {
  final String? banner;
  final String? bannerTitle;

  Banner({
    this.banner,
    this.bannerTitle,
  });

  Banner.fromJson(Map<String, dynamic> json)
      : banner = json['banner'] as String?,
        bannerTitle = json['banner_title'] as String?;

  Map<String, dynamic> toJson() =>
      {'banner': banner, 'banner_title': bannerTitle};
}

class HorizontalSlider {
  final String? heading;
  final String? nameSlug;
  final dynamic typeImage;
  final String? createdAt;
  final String? updatedAt;
  final List<Data>? data;

  HorizontalSlider({
    this.heading,
    this.nameSlug,
    this.typeImage,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  HorizontalSlider.fromJson(Map<String, dynamic> json)
      : heading = json['heading'] as String?,
        nameSlug = json['name_slug'] as String?,
        typeImage = json['type_image'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'heading': heading,
        'name_slug': nameSlug,
        'type_image': typeImage,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'data': data?.map((e) => e.toJson()).toList()
      };
}

class Data {
  final int? id;
  final String? title;
  final String? description;
  final String? listingImage;
  final String? actualPrice;
  final String? price;
  final int? currency;
  final String? currencyCode;
  final dynamic rating;
  final int? ratingCount;

  Data({
    this.id,
    this.title,
    this.description,
    this.listingImage,
    this.actualPrice,
    this.price,
    this.currency,
    this.currencyCode,
    this.rating,
    this.ratingCount,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        listingImage = json['listing_image'] as String?,
        actualPrice = json['actual_price'] as String?,
        price = json['price'] as String?,
        currency = json['currency'] as int?,
        currencyCode = json['currency_code'] as String?,
        rating = json['rating'],
        ratingCount = json['rating_count'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'listing_image': listingImage,
        'actual_price': actualPrice,
        'price': price,
        'currency': currency,
        'currency_code': currencyCode,
        'rating': rating,
        'rating_count': ratingCount
      };
}
