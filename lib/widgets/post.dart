import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';

class Post extends StatelessWidget {
  const Post({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.54,
      margin: EdgeInsets.only(top: size.height * 0.01),
      color: Colors.white,
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.width * 0.03),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Sarthak", style: kPostHiglightedTag),
                        SizedBox(width: 4),
                        Text(
                          "celebrates this",
                          style: kPostLightTag,
                        )
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Color(0xFFe0e0e0),
                ),
                Row(
                  children: [
                    Container(
                      height: size.height * 0.08,
                      width: size.height * 0.08,
                      child: CircleAvatar(
                        child: Image.network(
                            "https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0/1519856215226?e=1622073600&v=beta&t=p9zXj2dj6BXsOGH65sw6Sw4iWqAg_h4q38ABubR4a2A",
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      height: size.height * 0.08,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Google",
                            style: kPostHiglightedTag,
                          ),
                          Text(
                            "20,701,240 followers",
                            style: kPostSmallText,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "1w",
                                style: kPostSmallText,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.circle,
                                size: 3.2,
                                color: Color(0xFF7a7a7a),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.public,
                                size: 12,
                                color: Color(0xFF7a7a7a),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: kHomePageBackground,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://media-exp1.licdn.com/dms/image/C5622AQEcCkjOSS3xJg/feedshare-image-offsite-ads_350_624/0/1613995014067?e=1617235200&v=beta&t=ukgWOspqqx8TBnU99KhVnUL2f-EdbOkg_sVtRatoLyM",
                    ),
                    fit: BoxFit.cover),
              ))
        ],
      ),
    );
  }
}
