import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Charity {
  String? id;
  String? name;
  String? address;
  String? logoUrl;
  List<Service>? servicesTypes;

  Charity({
    this.id,
    this.name,
    this.address,
    this.logoUrl,
    this.servicesTypes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'logoUrl': logoUrl,
      'servicesTypes': servicesTypes!.map((x) => x.toJson()).toList(),
    };
  }

  factory Charity.fromJson( json) {
    return Charity(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        logoUrl: json['logoUrl'],
        servicesTypes: Service.fromJsonArray(json['servicesTypes']));
  }
}

class Service {
  String? id;
  String? name;
  String? logoUrl;
  List<Products>? productsList;
  Service({
    this.id,
    this.name,
    this.logoUrl,
    this.productsList,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'productsList': productsList!.map((x) => x.toJson()).toList(),
    };
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
        id: json['id'],
        name: json['name'],
        logoUrl: json['logoUrl'],
        productsList: Products.fromJsonArray(json['productsList']));
  }
  static List<Service> fromJsonArray(List<dynamic> jsonArray) {
    List<Service> subCategoriesFromJson = [];

    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(Service.fromJson(jsonData));
    });

    return subCategoriesFromJson;
  }
}


class Products {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  Products({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id']!= null ? json['id'] as String : null,
      name: json['name'] != null ? json['name'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
      imageUrl: json['imageUrl'] != null ? json['imageUrl'] as String : null,
    );
  }

  static List<Products> fromJsonArray(List<dynamic> jsonArray) {
    List<Products> subCategoriesFromJson = [];

    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(Products.fromJson(jsonData));
    });

    return subCategoriesFromJson;
  }

  // factory Products.fromJson(String source) =>
  //     Products.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Charity> charitiesList = [
  Charity(
    id: '1',
    name: 'جمعية البر الخيرية',
    address: 'شمال الرياض',
    logoUrl: 'assets/images/alber.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'ملابس',
        logoUrl: 'assets/images/clothes.png',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: 'assets/images/clothes.png'),
          Products(
              id: '2',
              name: 'دراعة بناتي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: 'assets/images/clothes.png'),
          Products(
              id: '3',
              name: ' عباءة نسائي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: 'assets/images/clothes.png'),
          Products(
              id: '4',
              name: ' جاكت ولادي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: 'assets/images/clothes.png'),
        ],
      ),
      Service(
        id: '2',
        name: 'كتب',
        logoUrl: 'assets/images/books.png',
        productsList: [
          Products(
              id: '1',
              name: 'كتاب اللغة الانجليزية',
              description: ' كتاب تعلم اللغة الانجليزية من الصفر',
              imageUrl: 'assets/images/books.png'),
          Products(
              id: '2',
              name: 'كتاب تعلم البرمجة  ',
              description: 'مقرر برمجة شيئية مستوى أول',
              imageUrl: 'assets/images/books.png'),
          Products(
              id: '3',
              name: 'كتاب القراءة',
              description: 'كتاب القراءة للصف الثالث ',
              imageUrl: 'assets/images/books.png'),
          Products(
              id: '4',
              name: 'كتاب علوم',
              description: 'كتاب العلوم للصف الرابع',
              imageUrl: 'assets/images/books.png'),
        ],
      ),
      Service(
        id: '3',
        name: 'طعام',
        logoUrl: 'assets/images/food.png',
        productsList: [
          Products(
              id: '1',
              name: 'لحم',
              description: 'صحن من اللحم الفائض',
              imageUrl: 'assets/images/food.png'),
          Products(
              id: '2',
              name: 'أرز',
              description: 'ثلاثة كيلو من الأرز',
              imageUrl: 'assets/images/food.png'),
          Products(
              id: '3',
              name: 'خبز',
              description: 'خمسة أكياس من الرغيف',
              imageUrl: 'assets/images/food.png'),
          Products(
              id: '4',
              name: 'كبسة',
              description: 'صحن من الكبسة ',
              imageUrl: 'assets/images/food.png'),
        ],
      ),
      Service(
        id: '4',
        name: 'أثاث',
        logoUrl: 'assets/images/athath.png',
        productsList: [
          Products(
              id: '1',
              name: 'أثاث مكتبي',
              description: 'يوجد أثاث مكتبي شبه جديد',
              imageUrl: 'assets/images/athath.png'),
          Products(
              id: '2',
              name: 'غرفة نوم',
              description: 'أثاث لغرفة نوم سعة 8*8',
              imageUrl: 'assets/images/athath.png'),
          Products(
              id: '3',
              name: 'موكيت',
              description: 'اذا كنت بحاجة موكيت بمقاس 15 * 20',
              imageUrl: 'assets/images/athath.png'),
          Products(
              id: '4',
              name: 'مجلس عربي',
              description: 'تأثيث كامل لمجلس عربي',
              imageUrl: 'assets/images/athath.png'),
        ],
      ),
    ],
  ),
  Charity(
    id: '2',
    name: 'جمعية كبار السن',
    address: ' الرياض - جاليري',
    logoUrl: 'assets/images/kibar.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'أدوية',
        logoUrl: 'assets/images/midicin.png',
        productsList: [
          Products(
              id: '1',
              name: 'دواء القلب',
              description: 'دواء امراض القلب ابر',
              imageUrl: 'assets/images/midicin.png'),
          Products(
              id: '2',
              name: 'ضغط الدم',
              description: 'دواء للتخفيف من ضغط الدم عند الكبار',
              imageUrl: 'assets/images/midicin.png'),
          Products(
              id: '3',
              name: 'السكر',
              description: 'علاج ارتفاع السكر المزمن',
              imageUrl: 'assets/images/midicin.png'),
          Products(
              id: '4',
              name: 'دواء الالتهابات',
              description: 'علاج التهاب المفاصل عند كبار السن',
              imageUrl: 'assets/images/midicin.png'),
          Products(
              id: '5',
              name: 'دواء القرحة',
              description: 'علاج لقرحة المعدة والاثناعشر',
              imageUrl: 'assets/images/midicin.png'),
          Products(
              id: '6',
              name: 'دواء الالتهابات',
              description: 'علاج التهابات المعدة عند كبار السن',
              imageUrl: 'assets/images/midicin.png'),
       
        ],
      ),
      Service(
        id: '2',
        name: 'معدات طبية',
        logoUrl: 'assets/images/teb.png',
        productsList: [
          Products(
              id: '1',
              name: 'كرسي متحرك',
              description: 'كرسي مترحك لمساعدة المعوقين',
              imageUrl: 'assets/images/teb.png'),
          Products(
              id: '2',
              name: 'نظارات',
              description: 'اذا كنت تعاني من ضعف النظر ',
              imageUrl: 'assets/images/teb.png'),
     
        ],
      ),
      Service(
        id: '3',
        name: 'ملابس ',
        logoUrl: 'assets/images/clothes.png',
        productsList: [
          Products(
              id: '1',
              name: 'فنيلة ',
              description: 'فنيلة لكبار السن واسعة',
              imageUrl: 'assets/images/clothes.png'),
          Products(
              id: '2',
              name: 'غترة',
              description: 'غترة رجالي بمقاس xxl',
              imageUrl: 'assets/images/clothes.png'),
     
          Products(
              id: '3',
              name: 'سروال',
              description: 'سروال رجالي مريح',
              imageUrl: 'assets/images/clothes.png'),
     
        ],
      ),
    ],
  ),
  Charity(
    id: '3',
    name: 'جمعية أسر التوحد',
    address: ' الرياض',
    logoUrl: 'assets/images/osar.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'ملابس',
        logoUrl: 'assets/images/clothes.png',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: 'assets/images/clothes.png')
        ],
      )
    ],
  ),
  Charity(
    id: '4',
    name: 'جمعية الأمير فهد ...',
    address: ' الرياض - حي الملقاء',
    logoUrl: 'assets/images/fahd.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'ملابس',
        logoUrl: 'assets/images/clothes.png',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: 'assets/images/clothes.png')
        ],
      )
    ],
  ),
];
