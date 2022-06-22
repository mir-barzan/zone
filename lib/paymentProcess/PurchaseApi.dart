import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  static const _apiKey = "goog_uFOKcNaYLmwGxQKikxrpGhmFKvA";

  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    await Purchases.setup(_apiKey);
  }

  static Future<List<Offering>> fetchOfferById(List<String> ids) async {
    final offers = await fetchOffers();

    return offers.where((offer) => ids.contains(offer.identifier)).toList();
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;

      return current == null ? [] : [current];
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<bool> PurchaseProduct(String ProductName) async {
    bool result = false;
    try {
      await Purchases.purchaseProduct(ProductName);

      result = true;
    } catch (e) {
      return false;
    }
    return result;
  }
}
