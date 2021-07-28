import 'package:flutter/material.dart';
import 'package:nestore/resources/app_color.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100], width: 1)
        ),
        child: Padding(
            padding: EdgeInsets.only(top: 25, bottom: 10, left: 0, right: 0),
            child: Row(
              children: [
                Expanded(
                    child: Container(

                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-YHTYySZO4IHxlF8acRE_nt3T3NHSOPjoQ&usqp=CAU')
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 5),
                            child: Text(
                                'Tri-Activ Instant Hand Sanitizer 500 ml',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16))
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 5, left: 10, right: 5),
                            child: Container(
                                width: double.infinity,
                                child: Wrap(
                                  children: [
                                    Text('Best Price ', style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                    Text('Rs. 900', style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.deepOrangeAccent))
                                  ],
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 5, left: 10, right: 5),
                            child: Container(
                                width: double.infinity,
                                child: Wrap(
                                  children: [
                                    Text('MRP ', style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                    Text('Rs. 250.00 ', style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.deepOrangeAccent)),
                                    Text(' GET 5% OFF', style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.lightGreen))
                                  ],
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 5, left: 10, right: 5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: Text('By Medisales',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.grey)),
                                    )
                                ),
                                Expanded(
                                    child: RawMaterialButton(
                                      onPressed: () {
// userLogin();
// Navigator.of(context).push(
//   MaterialPageRoute(
//     builder: (context) => SignUpPage(),
//   ),
// );
                                      },
                                      elevation: 1.0,
                                      fillColor: AppColors.primaryColor,
                                      child: Text('ADD TO CART',
                                        style: TextStyle(color: Colors.white),),
                                      padding: EdgeInsets.all(12.0),

                                    )
                                )
                              ],
                            )
                        )
                      ],
                    )
                )
              ],
            )
        )
    );
  }
}
