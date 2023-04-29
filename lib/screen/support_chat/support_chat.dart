import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api_services.dart';
import '../../model/support_chat_model.dart';
import '../home/listner_image.dart';

class SupportChat extends StatefulWidget {
  final SupportChatModel? supportChatModel;
  const SupportChat({super.key, this.supportChatModel});

  @override
  State<SupportChat> createState() => _SupportChatState();
}

class _SupportChatState extends State<SupportChat> {
  bool isProgressRunning = false;

  late final Uri url;

  Future<void> readMessage() async {
    if (widget.supportChatModel!.allMessages!.isNotEmpty &&
        widget.supportChatModel?.allMessages?[0].id != null) {
      for (int i = 0; i < widget.supportChatModel!.allMessages!.length; i++) {
        if (widget.supportChatModel?.allMessages?[i].id != null) {
          await apiMessageRead(widget.supportChatModel?.allMessages?[i].id);
        }
      }
    }
  }

  // Message Read
  Future<void> apiMessageRead(int? messageId) async {
    try {
      setState(() {
        isProgressRunning = true;
      });

      await APIServices.getSupportMessageReadAPI(messageId ?? 1);
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {
        isProgressRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        title: const Text('Support'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20, 15, 30),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.supportChatModel?.allMessages?.length ?? 0,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  widget.supportChatModel?.allMessages?[index].link != null &&
                      widget.supportChatModel!.allMessages![index].link!
                          .isNotEmpty;
                  final Uri url = Uri.parse(
                      widget.supportChatModel?.allMessages?[index].link ?? '');

                  Future<void> launchUrlInApp() async {
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 5,
                                    blurRadius: 5)
                              ],
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListnerImage(
                                                image: CachedNetworkImage(
                                                  imageUrl: widget
                                                          .supportChatModel
                                                          ?.allMessages?[index]
                                                          .image ??
                                                      '',
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    "assets/images/logo.png",
                                                    width: 60,
                                                    height: 60,
                                                    //  fit: BoxFit.cover,
                                                  ),
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                    "assets/images/logo.png",
                                                    width: 60,
                                                    height: 60,
                                                    //fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.supportChatModel
                                            ?.allMessages?[index].image ??
                                        '',
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "assets/images/logo.png",
                                      width: 60,
                                      height: 60,
                                      //  fit: BoxFit.cover,
                                    ),
                                    placeholder: (context, url) => Image.asset(
                                      "assets/images/logo.png",
                                      width: 60,
                                      height: 60,
                                      //fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(widget.supportChatModel?.allMessages?[index]
                                      .title ??
                                  ''),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.supportChatModel
                                              ?.allMessages?[index].message ??
                                          '',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    if (widget.supportChatModel
                                                ?.allMessages?[index].link !=
                                            null &&
                                        widget
                                            .supportChatModel!
                                            .allMessages![index]
                                            .link!
                                            .isNotEmpty) ...{
                                      const SizedBox(height: 6),
                                      InkWell(
                                        onTap: () {
                                          launchUrlInApp();
                                        },
                                        child: Text(
                                          widget.supportChatModel
                                                  ?.allMessages?[index].link ??
                                              '',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    }
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
