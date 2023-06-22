import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/flavorConfigNotifier.dart';
import 'package:flutter_form/constant/ConstantTest.dart';
import 'package:flutter_form/models/RestaurantMenuItemModel.dart';
import 'package:flutter_form/widgets/discoverMenuItem.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewSate();
}

class _HomePageViewSate extends State<HomePageView> {
  BannerAd _bannerAd;
  bool _isAdLoaded = false;
  Future<List<RestaurantMenuItemModel>> futureRestaurantItems;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
    // Use const tp get dart define variables
    const u = String.fromEnvironment("APP_API");
    print(u);
  }

  // Future<http.Response>  fetchRestaurantItems()  {
  //   http.get(Uri.parse(flavor));
  // }

  void _initBannerAd() {
    _bannerAd = new BannerAd(
        size: AdSize.banner,
        adUnitId: BannerAd.testAdUnitId,
        listener: AdListener(
            onAdLoaded: (ad) {
              setState(() {
                _isAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, error) {}),
        request: AdRequest());

    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlavorConfigNotifier>(
      builder: (context, flavorConfigNotifier, child) => Container(
        decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
        child: RefreshIndicator(
          onRefresh: () {
            // This is a test for now
            // This is suppose to fetch a network request
            return Future.delayed(Duration(seconds: 4));
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  itemCount: foodList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == foodList.length) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20, top: 20),
                        height: _bannerAd.size.height.toDouble(),
                        width: _bannerAd.size.width.toDouble(),
                        child: AdWidget(ad: _bannerAd),
                      );
                    }
                    return DiscoverMenuItem(
                      restaurantMenuItemModel: foodList[index],
                    );
                  },
                ),
              ),
              // _isAdLoaded
              //     ? Container(
              //         height: _bannerAd.size.height.toDouble(),
              //         width: _bannerAd.size.width.toDouble(),
              //         child: AdWidget(ad: _bannerAd),
              //       )
              //     : Text("")
            ],
          ),
        ),
      ),
    );
  }
}
