import 'package:flutter/material.dart';
import 'package:youtube_flutter_redesign/model/core/channel.dart';

class PopularChannels extends StatelessWidget {
  const PopularChannels({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Channel> channels = [
      Channel('Marques Brownlee', "10.2M", '1,027', 'images/you1.jpg'),
      Channel('Jacksfilms', "5.1M", '746', 'images/you2.jpg'),
      Channel('Reso Coder', "58.3K", '107', 'images/you3.jpg'),
      Channel('iJustine', "5.7M", '1,158', 'images/you4.jpg'),
      Channel('Robert Brunhage', "30.7K", '204', 'images/you5.jpg'),
      Channel('Pewdiepie', "101M", '7,309', 'images/you6.png'),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Channels",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(10)),
            child: ListView.separated(
                physics: ScrollPhysics(),
                separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.08),
                    ),
                shrinkWrap: true,
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  Channel channel = channels[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(channel.logo),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                channel.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    " • ${channel.subCount} subscribers • ${channel.vidCount} videos",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 30,
                          child: TextButton(
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 0, 0, 1),
                            ),
                            ),
                            onPressed: () {},
                            child: Text(
                            "SUBSCRIBE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                            )),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

