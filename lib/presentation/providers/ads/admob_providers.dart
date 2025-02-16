import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../config/config.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  final ad = await AdmobPlugin.loadBannerAd();

  return ad;
});