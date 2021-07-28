import 'package:flutter/material.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_color.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/cart/cart.dart';
import 'package:nestore/ui/common/search_field.dart';
import 'package:nestore/ui/product/ProductDetail.dart';
import 'package:nestore/ui/product/products.dart';

class ProductByGroup extends StatefulWidget {
  String id;
  ProductByGroup({Key key, this.id}) : super(key: key);

  @override
  _ProductByCategoryState createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByGroup> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.1),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  color: Colors.white,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: GestureDetector(
                                    onTap:(){
                                      Navigator.of(context).pop();
                                    },
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(Icons.arrow_back, size: 30,color: AppColors.primaryColor)
                                    )
                                )
                            ),
                            Expanded(
                              flex:5,
                              child:  Text('NESTOR', textAlign: TextAlign.center,style: TextStyle(color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            Expanded(
                              child: Align(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CartPage(),
                                            ),
                                          );
                                        },
                                        child: Icon(Icons.shopping_cart_rounded, color: AppColors.primaryColor)
                                    )
                                ),
                              ),
                            )
                          ],
                        ),

                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:0, bottom:0),
            child: Column(
              children: [
                AllRestaurants(id: this.widget.id)
              ],
            )
        ),
      ),
    );
  }
}

class AllRestaurants extends StatefulWidget {
  String id;
  AllRestaurants({Key key, this.id}) : super(key: key);

  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController otpCtrl = TextEditingController(text: '');
  final authService = AuthService();
  List products = [];

  void initState() {
    super.initState();
    getTermsAndCondition();
  }

  getTermsAndCondition() async {
    Result response  = await authService.fetchProductByCategory(this.widget.id);
    if(response is SuccessState) {

      if(response.value['status'] == true) {
        if(response.value['data'].length > 0) {
          setState(() {
            products = response.value['data'];
          });
        }

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:10, top:10, left:10, right:10),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [

                if(products != null && products.length <= 0)
                  Container(
                      height: 100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('No products found!')
                      )
                  ),
                if(products != null && products.length > 0)
                  for (int i=0; i<products.length; i++)GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(id: products[i]['id'].toString()),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[100], width:1),
                              borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top:25, bottom:10, left:0, right: 0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(

                                          child: Image.network(products[i]['image'])
                                      )
                                  ),
                                  Expanded(
                                      flex:2,
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(top:5, bottom:5, left:10, right: 5),
                                              child: Text(products[i]['generic_name'], style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE))
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                                              child: Container(
                                                  width: double.infinity,
                                                  child: Wrap(
                                                    children: [
                                                      Text('MRP ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE)),
                                                      Text('Rs. ${products[i]['mrp_amount']} ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.deepOrangeAccent)),
                                                      Text(' GET ${products[i]['offer']}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.lightGreen))
                                                    ],
                                                  )
                                              )
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Text('${products[i]['package']}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE, color: Colors.grey)),
                                                      )
                                                  ),

                                                ],
                                              )
                                          )
                                        ],
                                      )
                                  )
                                ],
                              )
                          )
                      )
                  ),
              ],
            )
        )
    );
  }
}
