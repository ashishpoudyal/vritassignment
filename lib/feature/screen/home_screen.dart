import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vrit_project/feature/provider/my_provider.dart';
import 'package:vrit_project/feature/screen/genertaed_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController urlTextEditingController = TextEditingController(
      text: "https://www.youtube.com/channel/UCHK4HD0ltu1-I212icLPt3g");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20.0),
          child:
              Consumer<MyProviderNotifier>(builder: (context, provider, chils) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shorten Your Url Powered By Rebrandly",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TextFormField(
                  controller: urlTextEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Make your link shorter",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GeneratedView(),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      log(urlTextEditingController.text);
                      provider.genetateShortUrl(urlTextEditingController.text);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 18.0),
                      child: Center(
                        child: provider.isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Shorten Url",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
