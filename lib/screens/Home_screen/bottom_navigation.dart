import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigation({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
       /* Consumer<AdProvider>(
          builder: (context, adProvider, child) {
            if (adProvider.isDetailsPageBannerLoaded) {
              return Container(
                height: adProvider.detailsPageBanner.size.height.toDouble(),
                child: AdWidget(ad: adProvider.detailsPageBanner),
              );
            } else {
              return Container(height: 0);
            }
          },
        ),*/
        BottomNavigationBar(
          backgroundColor: Colors.blue[400],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue[400],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.admin_panel_settings_sharp),
              label: 'Admin Login',
              backgroundColor: Colors.blue[400],
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'About Us',
              backgroundColor: Colors.blue[400],
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'Share',
              backgroundColor: Colors.blue[400],
            ),
          ],
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ],
    );
  }
}
