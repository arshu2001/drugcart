import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {
  String id;
  final String  medicinename;
  final String medicineprice;
  final String description;
  final String faq;
  final String answer;
  final String category;
  final List<String> imageurls;

  Medicine({
    this.id = '',
    required this.medicinename,
    required this.medicineprice,
    required this.description,
    required this.faq,
    required this.category,
    required this.imageurls,
    required this.answer,
  });

  factory Medicine.fromMap(dynamic source) {
    Map<String, dynamic> data;
    String id;

    if(source is DocumentSnapshot) {
      data = source.data() as Map<String, dynamic>;
      id = source.id;
    }else if (source is Map<String, dynamic>){
      data = source;
      id = data['id'] ?? '';
    }else {
      throw ArgumentError('Invalid source type for Medicine.fromMap');
    }

    return Medicine(
      id: id,
      medicinename: data['medicinename'] ?? '',
      medicineprice: data['medicineprice'] ?? '',
      description: data['description'] ?? '', 
      faq: data['faq'],
      answer: data['answer'],
      category: data['category'],
      imageurls: List<String>.from(data['imageurls'] ?? [])
      );
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'medicinename' : medicinename,
      'medicineprice' : medicineprice,
      'description' : description,
      'faq' : faq,
      'answer': answer,
      'category': category,
      'imageurls' : imageurls,
      
    };
  }
}