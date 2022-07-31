import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BottomNavigationBar(
    //   elevation: 0,
    //   selectedItemColor: Colors.green,
    //   unselectedItemColor: Colors.grey,
    //   backgroundColor: Colors.green,
    //    currentIndex: 0, // this will be set when a new tab is tapped
    //    items: [
    //      BottomNavigationBarItem(
    //        icon: new Icon(Icons.home),
    //        label: 'Home',
    //       //  title: Text('Home'),
    //       //  label: 'Home',
    //      ),
    //      BottomNavigationBarItem(
    //        icon: new Icon(Icons.search),
    //        title: Text('Search'),
    //      ),
    //      BottomNavigationBarItem(
    //        icon: Icon(Icons.photo_camera_sharp),
    //        title: Text('Scan'),
    //      ),
    //      BottomNavigationBarItem(
    //        icon: Icon(Icons.bookmark_added_rounded),
    //        title: Text('Saved'),
    //      ),
    //      BottomNavigationBarItem(
    //        icon: Icon(Icons.person),
    //        title: Text('Account'),
    //      ),
    //    ],
    //  );
    return Container(
      height: 80.0,
      color: Colors.white,
      padding:  EdgeInsets.only(top: 20.0),
      child:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon( 
              Icons.camera,
              // color: Colors.transparent,
            ),
            label: 'Scan',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_added_outlined),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Account',
          ),
         
        ],
      ),
    );
  }
}
