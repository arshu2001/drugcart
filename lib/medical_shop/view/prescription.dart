import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Prescription', size: 20,weight: FontWeight.bold,),centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
              onDoubleTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => UserOrderDetails(),));
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.asset('images/zincovit.png',fit: BoxFit.fill,),
                          ),
                          CustomText(text: 'Name', size: 18)
                        ],
                      ),
                    ),
                    Flexible(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                          ),
                          onPressed: () {
                          
                        }, child: CustomText(text: 'Take Order', size: 18,weight: FontWeight.w600,color: Colors.white,)),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                            ),
                              onPressed: () {
                            
                                                    }, child: CustomText(text: 'Ignoe', size: 18,weight: FontWeight.w600,color: Colors.white,)),
                          ),
                      ],
                    )),
                     
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Divider()
        ],
      ),
    );
  }
}