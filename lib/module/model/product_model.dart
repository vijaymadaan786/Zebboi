class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.beforePrice,
    this.stockAvailability,
    this.shortDesc,
    this.longDesc,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.currencyType,
    this.sku,
    this.newArrival,
    this.bestSeller,
    this.featured,
    this.flashDeal,
    this.countdown,
    this.countdownIFNEED,
    this.countdownIfNeed,
    this.hotSale,
    this.hot,
    this.trending,
    this.special,
    this.popular,
    this.topRated,
    this.additionalInformation,
    // this.additionalInformation,
    this.reviews,
    this.productDetailsImg,
    this.productFrontImg,
    this.categories,
    this.colors,
    this.brands,
    // this.orders,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    beforePrice = json['beforePrice'];
    stockAvailability = json['stockAvailability'];
    shortDesc = json['shortDesc'];
    longDesc = json['longDesc'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    currencyType = json['currencyType'];
    sku = json['sku'];
    newArrival = json['newArrival'];
    bestSeller = json['bestSeller'];
    featured = json['featured'];
    flashDeal = json['flashDeal'];
    countdown = json['countdown'];
    countdownIFNEED = json['countdown_IFNEED'];
    countdownIfNeed = json['countdown_IfNeed'];
    hotSale = json['hotSale'];
    hot = json['hot'];
    trending = json['trending'];
    special = json['special'];
    popular = json['popular'];
    topRated = json['topRated'];
    additionalInformation = json['additionalInformation'];
    // additionalInformation = json['Additional_Information'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    if (json['productDetailsImg'] != null) {
      productDetailsImg = [];
      json['productDetailsImg'].forEach((v) {
        productDetailsImg?.add(ProductDetailsImg.fromJson(v));
      });
    }
    productFrontImg = json['productFrontImg'] != null
        ? ProductFrontImg.fromJson(json['productFrontImg'])
        : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors?.add(Colors.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = [];
      json['brands'].forEach((v) {
        brands?.add(Brands.fromJson(v));
      });
    }
    // if (json['orders'] != null) {
    //   orders = [];
    //   json['orders'].forEach((v) {
    //     orders?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  int? id;
  String? title;
  int? price;
  int? beforePrice;
  int? stockAvailability;
  String? shortDesc;
  String? longDesc;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? currencyType;
  String? sku;
  bool? newArrival;
  bool? bestSeller;
  bool? featured;
  bool? flashDeal;
  dynamic countdown;
  dynamic countdownIFNEED;
  String? countdownIfNeed;
  dynamic hotSale;
  bool? hot;
  bool? trending;
  bool? special;
  bool? popular;
  bool? topRated;
  String? additionalInformation;
  // dynamic additionalInformation;
  List<Reviews>? reviews;
  List<ProductDetailsImg>? productDetailsImg;
  ProductFrontImg? productFrontImg;
  List<Categories>? categories;
  List<Colors>? colors;
  List<Brands>? brands;
  // List<dynamic>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['beforePrice'] = beforePrice;
    map['stockAvailability'] = stockAvailability;
    map['shortDesc'] = shortDesc;
    map['longDesc'] = longDesc;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['slug'] = slug;
    map['currencyType'] = currencyType;
    map['sku'] = sku;
    map['newArrival'] = newArrival;
    map['bestSeller'] = bestSeller;
    map['featured'] = featured;
    map['flashDeal'] = flashDeal;
    map['countdown'] = countdown;
    map['countdown_IFNEED'] = countdownIFNEED;
    map['countdown_IfNeed'] = countdownIfNeed;
    map['hotSale'] = hotSale;
    map['hot'] = hot;
    map['trending'] = trending;
    map['special'] = special;
    map['popular'] = popular;
    map['topRated'] = topRated;
    map['additionalInformation'] = additionalInformation;
    // map['Additional_Information'] = additionalInformation;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    if (productDetailsImg != null) {
      map['productDetailsImg'] =
          productDetailsImg?.map((v) => v.toJson()).toList();
    }
    if (productFrontImg != null) {
      map['productFrontImg'] = productFrontImg?.toJson();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      map['colors'] = colors?.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      map['brands'] = brands?.map((v) => v.toJson()).toList();
    }
    // if (orders != null) {
    //   map['orders'] = orders?.map((v) => v.toJson()).toList();
    // }
    return map;
  }
}

class Brands {
  Brands({
    this.id,
    this.brand,
    this.slug,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.qty,
  });

  Brands.fromJson(dynamic json) {
    id = json['id'];
    brand = json['brand'];
    slug = json['slug'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    qty = json['qty'];
  }
  int? id;
  String? brand;
  String? slug;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  dynamic qty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brand'] = brand;
    map['slug'] = slug;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['qty'] = qty;
    return map;
  }
}

class Colors {
  Colors({
    this.id,
    this.color,
    this.slug,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  Colors.fromJson(dynamic json) {
    id = json['id'];
    color = json['color'];
    slug = json['slug'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? color;
  String? slug;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['color'] = color;
    map['slug'] = slug;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Categories {
  Categories({
    this.id,
    this.category,
    this.slug,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  Categories.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    slug = json['slug'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? category;
  String? slug;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['slug'] = slug;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class ProductFrontImg {
  ProductFrontImg({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    // this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  ProductFrontImg.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  // ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternativeText'] = alternativeText;
    map['caption'] = caption;
    map['width'] = width;
    map['height'] = height;
    if (formats != null) {
      map['formats'] = formats?.toJson();
    }
    map['hash'] = hash;
    map['ext'] = ext;
    map['mime'] = mime;
    map['size'] = size;
    map['url'] = url;
    map['previewUrl'] = previewUrl;
    map['provider'] = provider;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

// class ProviderMetadata {
//   ProviderMetadata({
//     this.publicId,
//     this.resourceType,
//   });

//   ProviderMetadata.fromJson(dynamic json) {
//     publicId = json['public_id'];
//     resourceType = json['resource_type'];
//   }
//   String? publicId;
//   String? resourceType;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['public_id'] = publicId;
//     map['resource_type'] = resourceType;
//     return map;
//   }
// }

class Formats {
  Formats({
    this.small,
    this.thumbnail,
  });

  Formats.fromJson(dynamic json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
  }
  Small? small;
  Thumbnail? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (small != null) {
      map['small'] = small?.toJson();
    }
    if (thumbnail != null) {
      map['thumbnail'] = thumbnail?.toJson();
    }
    return map;
  }
}

class Thumbnail {
  Thumbnail({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    // this.providerMetadata,
  });

  Thumbnail.fromJson(dynamic json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
  }
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  // ProviderMetadata? providerMetadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ext'] = ext;
    map['url'] = url;
    map['hash'] = hash;
    map['mime'] = mime;
    map['name'] = name;
    map['path'] = path;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    return map;
  }
}

class Small {
  Small({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    // this.providerMetadata,
  });

  Small.fromJson(dynamic json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
  }
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  // ProviderMetadata? providerMetadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ext'] = ext;
    map['url'] = url;
    map['hash'] = hash;
    map['mime'] = mime;
    map['name'] = name;
    map['path'] = path;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    return map;
  }
}

class ProductDetailsImg {
  ProductDetailsImg({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    // this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  ProductDetailsImg.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  // ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternativeText'] = alternativeText;
    map['caption'] = caption;
    map['width'] = width;
    map['height'] = height;
    if (formats != null) {
      map['formats'] = formats?.toJson();
    }
    map['hash'] = hash;
    map['ext'] = ext;
    map['mime'] = mime;
    map['size'] = size;
    map['url'] = url;
    map['previewUrl'] = previewUrl;
    map['provider'] = provider;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Reviews {
  Reviews({
    this.id,
    this.name,
    this.ratings,
    this.feedback,
    this.authorImg,
  });

  Reviews.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    ratings = json['ratings'];
    feedback = json['Feedback'];
    authorImg = json['authorImg'] != null
        ? AuthorImg.fromJson(json['authorImg'])
        : null;
  }
  int? id;
  String? name;
  int? ratings;
  String? feedback;
  AuthorImg? authorImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['ratings'] = ratings;
    map['Feedback'] = feedback;
    if (authorImg != null) {
      map['authorImg'] = authorImg?.toJson();
    }
    return map;
  }
}

class AuthorImg {
  AuthorImg({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    // this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  AuthorImg.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  // ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternativeText'] = alternativeText;
    map['caption'] = caption;
    map['width'] = width;
    map['height'] = height;
    if (formats != null) {
      map['formats'] = formats?.toJson();
    }
    map['hash'] = hash;
    map['ext'] = ext;
    map['mime'] = mime;
    map['size'] = size;
    map['url'] = url;
    map['previewUrl'] = previewUrl;
    map['provider'] = provider;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
