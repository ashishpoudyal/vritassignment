import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImage extends StatelessWidget {
  final data;
  const QrImage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Generated Qr code is here scan ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          QrImageView(
            data: data,
            version: QrVersions.auto,
            size: 200.0,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(360),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 14.0),
              child: Text(
                "Close",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
