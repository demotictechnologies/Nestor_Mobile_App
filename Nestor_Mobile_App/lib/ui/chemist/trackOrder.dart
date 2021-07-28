import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:nestore/model/result.dart';
import 'package:nestore/network/orders.dart';
import 'package:nestore/resources/app_style.dart';
import 'package:nestore/ui/common/borderButton.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key key}) : super(key: key);

  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<TrackOrder> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final authService = AuthService();
  List orders = [];

  void initState() {
    super.initState();
    getTermsAndCondition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                left: 0, right: 0, top:0, bottom:0),
            child: Column(
              children: [
                if(orders != null && orders.length > 0) AllRestaurants(data: orders)
              ],
            )
        ),
      ),
    );
  }

  getTermsAndCondition() async {
    Result response  = await authService.getOrderHistory();
    if(response is SuccessState) {
      if(response.value['status'] == true) {
        print(response.value);
        setState(() {
          orders = response.value['data'];
        });
      }
    }
  }
}

class AllRestaurants extends StatefulWidget {
  List data;
  AllRestaurants({Key key, this.data}) : super(key: key);

  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:10, top:10, left:5, right:5),
        child: Container(
          color: Colors.grey[200],
            child: Column(
              children: [
                for (int i=0; i<5; i++)Padding(
                    padding: EdgeInsets.only(bottom:5, top:5, left:0, right:0),
                  child: OrderCard()
                ),
              ],
            )
        )
    );
  }
}


class OrderCard extends StatefulWidget {

  OrderCard({Key key}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(color: Colors.grey[100], width:1)
        ),
        child: Padding(
            padding: EdgeInsets.only(top:25, bottom:10, left:0, right: 0),
            child: Row(
              children: [
                Expanded(
                    flex:2,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top:10, bottom:5, left:10, right: 5),
                            child: Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text('36 items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppStyles.SMALL_TEXTSIZE)),
                                      ),
                                    ),
                                   Expanded(
                                     child: Align(
                                         alignment: Alignment.bottomRight,
                                         child: Text('Rs. 900', style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppStyles.SMALL_TEXTSIZE))
                                     )
                                   )
                                  ],
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                            child: Container(
                                width: double.infinity,
                                child: Wrap(
                                  children: [
                                    Text('Scheduled for', style: TextStyle(fontWeight: FontWeight.w500, fontSize: AppStyles.SMALL_TEXTSIZE)),
                                    Text(' Sun, 9 May, 12 PM - 2 PM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppStyles.SMALL_TEXTSIZE)),
                                  ],
                                )
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(top:2, bottom:5, left:10, right: 5),
                            child: Container(
                                width: double.infinity,
                                child: Wrap(
                                  children: [
                                    Text('Order id: ORD292845125', style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppStyles.SMALL_TEXTSIZE)),
                                  ],
                                )
                            )
                        ),
                        IconStepperDemo(),
                        Container(
                          width:double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 30, bottom: 0, left: 10, right: 10),
                              child: BorderButton(Title: 'View Details', onClick: (){
                    
                  },)
                          ),
                        ),
                      ],
                    )
                )
              ],
            )
        )
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}


class IconStepperDemo extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<IconStepperDemo> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 5; // Initial step set to 5.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          NumberStepper(
            alignment: Alignment.center,
            nextButtonIcon: Icon(Icons.add, color: Colors.white),
            previousButtonIcon: Icon(Icons.add, color: Colors.white),
            lineLength:MediaQuery.of(context).size.width *0.04,
            numbers: [
              1,
              2,3,4
            ],
            numberStyle: TextStyle(fontSize: AppStyles.SMALL_TEXTSIZE),
            // activeStep property set to activeStep variable defined above.
            activeStep: 0,
          ),
          header(),


        ],
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        headerText(),
        style: TextStyle(
          color: Colors.black,
          fontSize: AppStyles.SMALL_TEXTSIZE,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 0:
        return 'Placed';

      case 1:
        return 'Packed';

      case 2:
        return 'On The Way';

      case 3:
        return 'Delivered';

      default:
        return 'Placed';
    }
  }
}
