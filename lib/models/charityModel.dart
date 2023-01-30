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
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: ''),
          Products(
              id: '2',
              name: 'دراعة بناتي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: ''),
          Products(
              id: '3',
              name: ' عباءة نسائي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: ''),
          Products(
              id: '4',
              name: ' جاكت ولادي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: ''),
        ],
      ),
      Service(
        id: '2',
        name: 'كتب',
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: '')
        ],
      ),
      Service(
        id: '3',
        name: 'طعام',
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: '')
        ],
      ),
      Service(
        id: '4',
        name: 'أثاث',
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: '')
        ],
      ),
    ],
  ),
  Charity(
    id: '2',
    name: 'جمعية كبار السن',
    address: ' الرياض - جاليري',
    logoUrl: 'assets/images/alber.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'كتب',
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'كتاب تعلم اللغة الانجليزية',
              description: 'كتاب شامل لجميع مراحل اللغة الانجليزية',
              imageUrl: '')
        ],
      )
    ],
  ),
  Charity(
    id: '3',
    name: 'جمعية أسر التوحد',
    address: ' الرياض',
    logoUrl: 'assets/images/alber.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'ملابس',
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: '')
        ],
      )
    ],
  ),
  Charity(
    id: '4',
    name: 'جمعية الأمير فهد ...',
    address: ' الرياض - حي الملقاء',
    logoUrl: 'assets/images/alber.png',
    servicesTypes: [
      Service(
        id: '1',
        name: 'ملابس',
        logoUrl: '',
        productsList: [
          Products(
              id: '1',
              name: 'ثوب شبابي',
              description: 'المقاس:XXL-XL-L',
              imageUrl: '')
        ],
      )
    ],
  ),
];
