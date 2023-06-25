import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/changeNotifier/flavorConfigNotifier.dart';
import 'package:flutter_form/constant/ApiAddresse.dart';
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
    futureRestaurantItems = fetchRestaurantItems();
  }

  Future<List<RestaurantMenuItemModel>> fetchRestaurantItems() async {
    // Use const tp get dart define variables
    const APP_API_URL = String.fromEnvironment("APP_API");

    final response = await http
        .get(Uri.parse(APP_API_URL + ApiAdresse.ALL_RESTAURANTS_ITEMS));

    if (response.statusCode == 200) {
      List<dynamic> dynalist = jsonDecode(response.body);
      List<RestaurantMenuItemModel> restaurantMenuItems =
          List<RestaurantMenuItemModel>.from(dynalist
              .map((dynamic item) => RestaurantMenuItemModel.fromJosn(item)));
      return restaurantMenuItems;
    } else {
      throw Exception("No data found");
    }
  }

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

  var fadeAnimateTextStyle = TextStyle(
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<FlavorConfigNotifier>(
      builder: (context, flavorConfigNotifier, child) => Container(
        decoration: BoxDecoration(color: Color.fromRGBO(32, 32, 32, 0.5)),
        child: RefreshIndicator(
          onRefresh: () {
            // This is a test for now
            // This is suppose to fetch a network request
            return Future.delayed(Duration(seconds: 1), () {
              setState(() {
                futureRestaurantItems = fetchRestaurantItems();
              });
            });
          },
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: futureRestaurantItems,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                            child: Text(
                          "${snapshot.error}",
                          style: TextStyle(fontSize: 40),
                        ));
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right: 20,
                          ),
                          itemCount: snapshot.data.length + 1,
                          itemBuilder: (context, index) {
                            if (index == snapshot.data.length) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 20, top: 20),
                                height: _bannerAd.size.height.toDouble(),
                                width: _bannerAd.size.width.toDouble(),
                                child: AdWidget(ad: _bannerAd),
                              );
                            }
                            return DiscoverMenuItem(
                              restaurantMenuItemModel: snapshot.data[index],
                            );
                          },
                        );
                      }

                      return Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            CircularProgressIndicator(strokeWidth: 10),
                            SizedBox(height: 40),
                            AnimatedTextKit(
                              pause: Duration(milliseconds: 50),
                              repeatForever: true,
                              animatedTexts: [
                                FadeAnimatedText('Loading .',
                                    textStyle: fadeAnimateTextStyle),
                                FadeAnimatedText('Loading ..',
                                    textStyle: fadeAnimateTextStyle),
                                FadeAnimatedText('Loading ...',
                                    textStyle: fadeAnimateTextStyle),
                              ],
                            ),
                          ]));
                    }),
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
