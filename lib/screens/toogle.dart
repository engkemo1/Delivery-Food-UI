import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kamal/screens/MyHomePage.dart';

import 'order.dart';


class Toogle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Food',
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance_wallet_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.no_food)),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 10),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.redAccent.withOpacity(0.7),
              Colors.yellow,
          Colors.amberAccent.withOpacity(0.7),
        ], end: Alignment.topLeft, begin: Alignment.bottomLeft)),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: ExpansionTile(
                  title: Text("Select your Location",style: TextStyle(fontWeight: FontWeight.bold),),
                )),

SizedBox(height: MediaQuery.of(context).size.height-270,),
                Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30)

              ),
              child: ListTile(
                title: Text("Order Anything food",style: TextStyle(color: Colors.white),),
                subtitle:Text("Click here!",style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.chat_outlined,color: Colors.red,),
                trailing: Icon(Icons.phone_paused_rounded,color: Colors.red,),

              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: ExpandableFab(
        distance: 100.0,
        children: [
          ActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHomePage()));
            },
            icon: const Icon(Icons.food_bank_outlined,size: 40),text: "Grocery",
          ),
          ActionButton(
            onPressed:(){},
            icon: const Icon(Icons.table_chart,size: 35),text:"Dine Out",
          ),
          ActionButton(
            onPressed: () => (){},
            icon: const Icon(Icons.local_offer_outlined,size: 40,),text: "Offer",
          ),
          ActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>OrdersScreen()));
            },
            icon: const Icon(Icons.restaurant_menu_sharp,size: 40),text:"Orders",
          ),
          ActionButton(
            onPressed:(){},
            icon: const Icon(Icons.delivery_dining,size: 40),text:"Delivery",
          ),

        ],
      ),
    );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.linearToEaseOut,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 200.0,
      height: 200.0,
      child: Center(
        child: Material(
          color: Colors.white,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            elevation: 0,
backgroundColor: Colors.white,
            onPressed: _toggle,
            child: Image(image: AssetImage("image/hamburger.png"),
              height: 60,width: 60,

            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 55),
          progress.value * maxDistance,
        );
        return Positioned(
          right: MediaQuery.of(context).size.width * 0.5 - 44 + offset.dx,
          bottom: MediaQuery.of(context).size.height * 0.5-44 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon, required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 85,
      width: 85,

      decoration: BoxDecoration(  color: Colors.red,
        borderRadius: BorderRadius.circular(50)
      )

     , child: Column(
      children: [
      IconTheme.merge(
          data: theme.accentIconTheme,
          child: IconButton(

            onPressed: onPressed,
            icon: icon,
          ),
        ),
        SizedBox(height: 2,),
        Text(text,style: TextStyle(color: Colors.white,fontSize: 10),)
      ],
    ),
    );
  }
}
