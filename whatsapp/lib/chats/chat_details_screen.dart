import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/chats/models/chat_model.dart';
import 'package:whatsapp/chats/models/single_msg_model.dart';
import 'package:whatsapp/chats/widgets/chat_bubble.dart';
import 'package:whatsapp/chats/widgets/popup_box.dart';

class ChatDetailsScreen extends StatefulWidget {
  ChatDetailsScreen({Key? key, required this.chatDetails}) : super(key: key);

  ChatModel chatDetails;

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  bool isSend = false;

  bool showEmoji = false;

  final TextEditingController _messageController =
      TextEditingController(text: '');
  final FocusNode _focusNode = FocusNode();

  List<MessageModel> messages = [
    MessageModel(
        isReaded: true, isSend: true, message: 'Hiii', sendAtt: '9.00 am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'Helloo', sendAtt: '9.10 am'),
    MessageModel(
        isReaded: true, isSend: true, message: 'how r u', sendAtt: '9.15 am'),
    MessageModel(
        isReaded: false, isSend: false, message: 'fine', sendAtt: '9.18 am'),
    MessageModel(
        isReaded: true,
        isSend: true,
        message: 'iyy nale verindo',
        sendAtt: '9.30 am'),
    MessageModel(
        isReaded: false,
        isSend: false,
        message: 'njn illaa',
        sendAtt: '9.35 am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 3,
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
                backgroundImage: (widget.chatDetails.avatar == '')
                    ? AssetImage((widget.chatDetails.isGroup!)
                        ? 'assets/images/group.png'
                        : 'assets/images/profile.png')
                    : NetworkImage(widget.chatDetails.avatar!)
                        as ImageProvider),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatDetails.name.toString()),
            Text(
              'lastseen today at ${widget.chatDetails.updatedAt}',
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
        actions: [
          const Icon(Icons.video_call),
          const SizedBox(width: 20),
          const Icon(Icons.call),
          const SizedBox(
            width: 20,
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text((widget.chatDetails.isGroup!)
                      ? 'Group info'
                      : 'View contact'),
                ),
                PopupMenuItem(
                  child: Text((widget.chatDetails.isGroup!)
                      ? 'Group media'
                      : 'Media, links, and docs'),
                ),
                const PopupMenuItem(
                  child: Text('Search'),
                ),
                const PopupMenuItem(
                  child: Text('Mute notifications'),
                ),
                const PopupMenuItem(
                  child: Text('Disappearing messages'),
                ),
                const PopupMenuItem(
                  child: Text('Wallpaper'),
                ),
                const PopupMenuItem(
                  child: Text('More'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_img.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatBubble(
                    messageData: messages[index],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 70,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _messageController,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  isSend = true;
                                });
                              } else {
                                setState(() {
                                  isSend = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    _focusNode.unfocus();
                                    setState(() {
                                      showEmoji = !showEmoji;
                                    });
                                  },
                                  icon: Icon((showEmoji)
                                      ? Icons.keyboard
                                      : Icons.emoji_emotions),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.attach_file),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) =>
                                              const PopupBox(),
                                        );
                                      },
                                    ),
                                    const Icon(Icons.currency_rupee),
                                    const Icon(Icons.camera_alt),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                                hintText: 'Message'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: FloatingActionButton(
                          onPressed: () {
                            String tdata =
                                DateFormat("hh:mm:a").format(DateTime.now());
                            setState(() {
                              messages.add(MessageModel(
                                  isReaded: false,
                                  isSend: true,
                                  message: _messageController.text,
                                  sendAtt: tdata));
                                  _messageController.clear();
                            });
                          },
                          child: Icon((isSend) ? Icons.send : Icons.mic),
                        ),
                      ),
                    ],
                  ),
                  showEmoji == true ? selectEmoji() : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        _messageController.text = _messageController.text + emoji.emoji;
      },
    );
  }
}
