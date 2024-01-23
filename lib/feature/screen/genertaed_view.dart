import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vrit_project/feature/provider/my_provider.dart';
import 'package:vrit_project/feature/view/qr_image_view.dart';

class GeneratedView extends StatelessWidget {
  const GeneratedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProviderNotifier>(
      builder: (context, value, child) {
        return value.shortenUrlModel != null
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.greenAccent,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 9,
                              child: Text(
                                value.shortenUrlModel!.shortUrl,
                                maxLines: 1,
                              )),
                          InkWell(
                              onTap: () {
                                _copyToClipboard(
                                    value.shortenUrlModel!.shortUrl, context);
                              },
                              child: const Icon(Icons.copy)),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.white,
                                  useSafeArea: true,
                                  builder: (context) {
                                    return QrImage(data: "data");
                                  },
                                );
                              },
                              child: Container(
                                child: Icon(Icons.qr_code),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )
            : const SizedBox();
      },
    );
  }
}

void _copyToClipboard(textToCopy, BuildContext context) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Text copied to clipboard: $textToCopy'),
    ),
  );
}
