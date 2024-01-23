import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vrit_project/feature/data/model/shorten_url_model.dart';
import 'package:vrit_project/feature/repo/shorturl_repo.dart';

class MyProviderNotifier extends ChangeNotifier {
  ShortUrlRepo _shortUrlRepo = ShortUrlRepo();
  ShortenUrlModel? shortenUrlModel;
  bool isLoading = false;
  genetateShortUrl(final String url, BuildContext context) async {
    isLoading = true;
    shortenUrlModel = null;
    notifyListeners();
    Map body = {
      "destination": url,
      "domain": {"fullName": "rebrand.ly"}
    };

    final response = await _shortUrlRepo.shortUrl(body);
    response.fold((l) {
      log(
        "Error" + l.message.toString(),
      );
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Text copied to clipboard: ${l.message}',
          ),
        ),
      );
    }, (r) {
      shortenUrlModel = r;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }
}
