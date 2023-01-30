import 'package:charities/modules/signinpage.dart';
import 'package:charities/modules/signup.dart';
import 'package:flutter/material.dart';


import 'constants/theme.dart';
class Choose extends StatefulWidget{
  @override
  State <StatefulWidget> createState () => _ChooseState();
}

class _ChooseState extends State<Choose>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color.fromRGBO(236, 236, 236 ,1),
              ),

              width: double.infinity,
              height: 400,
              child: Image.asset('assets/images/4.jpg'),
            ),
          ),

          const SizedBox(height: 25,),

          //text
           Padding(
           padding:  const EdgeInsets.only(right: 20, left: 20),
           child:  Text('تستطيع الحصول على  \nالملابس , الكتب والطعام ',
             textAlign: TextAlign.center,
             style: subTitleTheme.copyWith(
               fontWeight: FontWeight.bold,
               fontSize: 14,
               height: 1.5,
             )
             ),
         ),

          const SizedBox(height: 40,),

          //sign in
          OutlinedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInPage()),
              );

            },
            child: const Text('تسجيل الدخول'),
            style: OutlinedButton.styleFrom(
                side:  BorderSide(width: .8, color: Colors.teal.shade700),
                primary: Colors.teal.shade700,
                fixedSize: const Size(320, 60),
                textStyle:titleTheme.copyWith(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          const SizedBox(height: 20,),
          //sign up
          OutlinedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: const Text('انشاء حساب جديد'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.teal.shade700,
              primary: Colors.white,
              fixedSize: const Size(320, 60),
              textStyle: titleTheme.copyWith(fontSize: 15, fontWeight: FontWeight.bold,),
            ),
          ),
        ],
      ),
    );
  }
}