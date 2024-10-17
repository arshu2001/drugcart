import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineOfferModal{
  String id;
  final String offername;
  final List<String> imageurls;

  MedicineOfferModal({
    this.id = '',
    required this.offername,
    required this.imageurls 
  });

  factory MedicineOfferModal.fromMap(dynamic source) {
    Map<String, dynamic> data;
    String id;

    if(source is DocumentSnapshot) {
      data = source.data() as Map<String, dynamic>;
      id = source.id;
    }else if(source is Map<String, dynamic>){
      data = source;
      id = data['id'] ?? '';
    }else{
      throw ArgumentError('Invalid source type for MedicineofferModal.fromMap');
    }
    return MedicineOfferModal(
      offername: data['offername'] ?? '', 
      imageurls: List<String>.from(data['imageurls'] ?? [])
      );
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'offername' : offername,
      'imageurls' : imageurls,
    };
  }
}