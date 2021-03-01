import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/widgets/Circle.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _controller;
  var scrolled = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent / 2 &&
        !_controller.position.outOfRange) {
      setState(() {
        scrolled = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent / 2 &&
        !_controller.position.outOfRange) {
      setState(() {
        scrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: !scrolled
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFF0b66c2),
              child: Icon(Icons.add),
            )
          : null,
      body: Container(
        color: kHomePageBackground,
        width: size.width,
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.038),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.015),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed("/");
                        },
                        child: Icon(Icons.arrow_back)),
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.7,
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sai Ashish",
                                style: TextStyle(
                                    backgroundColor: Colors.white,
                                    fontSize: 15,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: size.width * 0.7,
                          height: 1,
                          color: Colors.black,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/icons/profileBg.svg",
                    height: size.height * 0.126,
                    width: size.width,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.126),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          width: size.width,
                          child: Container(
                              margin: EdgeInsets.only(top: 56),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sai Ashish",
                                    style: TextStyle(color: Color(0xFF686868)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Spring Framework | Golang | Django | React Native | Angular | Graphql | Flutter | Node.js | Nuxt.js | Gatsby.js | Next.js | Ionic | Vue.js | Nest.js | AWS | Docker | k8s | Flask | PWA | Quasar| C#| ASP.NET| Android| Kotlin | 19yrs ",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFF535353)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "UVRobots",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF686868)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 3.6,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Maharaja Surajmal Institute Of Technology",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF686868)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Delhi, India",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF686868)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 3.6,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "500+ connections",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF2a63a1)),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          height: size.height * 0.325,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // height: size.height * 0.2,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                              vertical: size.width * 0.04),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "About",
                                    style: TextStyle(
                                        color: Color(0xFF545454), fontSize: 16),
                                  ),
                                  Icon(Icons.create_outlined)
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    Text(
                                      "I won GirlsScript India Hackathon held at Delhi Technological University, Hackxpress Hackathon sponsored by Microsoft at MapMyIndia...",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF373737)),
                                    ),
                                    Positioned(
                                      right: 38,
                                      top: 34,
                                      child: Text(
                                        "see more",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF999999),
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(size.width * 0.02),
                          color: Color(0xFFdce6f0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Your Dashboard",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "Private to you",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.military_tech_outlined,
                                          size: 18, color: Color(0xFF626971)),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "ALL-STAR",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF626971)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                // height: size.height * 0.11,
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Views(
                                        count: 214,
                                        text: "Who viewed your profile"),
                                    Views(count: "2,198", text: "Video views"),
                                    Views(
                                        count: "72",
                                        text: "Search appearances"),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Item(
                                      icon: Icon(
                                        Icons.credit_card_outlined,
                                        color: Color(0xFF686868),
                                      ),
                                      title: "Salary Insights",
                                      description:
                                          "Explore how your salary compares to your peers,and where your growth is headed",
                                    ),
                                    Divider(),
                                    Item(
                                      icon: Icon(
                                        Icons.bookmark,
                                        color: Color(0xFF686868),
                                      ),
                                      title: "My Items",
                                      description:
                                          "Keep track of your jobs,courses and articles",
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: size.height * 0.4,
                          width: size.width,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.02,
                                    top: size.width * 0.02,
                                    bottom: size.width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Activity",
                                      style:
                                          TextStyle(color: Color(0xFF595959)),
                                    ),
                                    Text(
                                      "1,679 followers",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2f69a4),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Activity(text: "Thank you Mr. Ambani"),
                              Activity(text: "Thank you sir 😊"),
                              Activity(text: "Thank you Rupak 😊"),
                              SizedBox(
                                height: 12,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Center(
                                    child: Text(
                                  "See all activity",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.white,
                          // height: size.height * 0.3,
                          padding: EdgeInsets.all(size.width * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Experience",
                                    style: TextStyle(
                                        color: Color(0xFF545454), fontSize: 16),
                                  ),
                                  Icon(Icons.create_outlined)
                                ],
                              ),
                              Experience(
                                image:
                                    "https://media-exp1.licdn.com/dms/image/C4D0BAQFBbAor8626NQ/company-logo_100_100/0/1593856316651?e=1622678400&v=beta&t=GkYPfDUirlGiSKMXNHlTtQdFhVKw4yoXlQC3s7Oo7no",
                                title: "Application Development Intern",
                                company: "UVRobots",
                              ),
                              Divider(),
                              Experience(
                                image:
                                    "https://media-exp1.licdn.com/dms/image/C4D0BAQHU5Xj9CBOKIA/company-logo_100_100/0/1609977500314?e=1622678400&v=beta&t=UNhvf-gTjUVjrQNQQoIAFKm2CqSXxqrZasaN30zp5AE",
                                title: "Application Development Intern",
                                company: "Velvet Video",
                              ),
                              Divider(),
                              Experience(
                                image:
                                    "https://media-exp1.licdn.com/dms/image/C560BAQH3qwISVjNp6A/company-logo_100_100/0/1602572377015?e=1622678400&v=beta&t=OZVWEL4ncWdK_W6mNTGqPoelFWnTjZ_byvf2eoMo8Cg",
                                title: "Application Development Intern",
                                company: "Inuvest Technologies",
                              ),
                              Divider(),
                              Experience(
                                image:
                                    "https://media-exp1.licdn.com/dms/image/C4E0BAQF_xgL6rc-UQw/company-logo_100_100/0/1519887649045?e=1622678400&v=beta&t=XDwjgp3gGBLmJJX51xXoWdN46jPvTjOrPk_TzaJAz-Q",
                                title: "React Js and React Native developer",
                                company: "App Town Technologies",
                              ),
                              Divider(),
                              Experience(
                                image:
                                    "https://media-exp1.licdn.com/dms/image/C4E0BAQGy8R-t1FskTw/company-logo_100_100/0/1600251955763?e=1622678400&v=beta&t=jqr9mpLsxZa3C7fNsZRdLJeETHKZL55Q84Tc0Zjkccs",
                                title:
                                    "Full Stack Web Developer (React.js + Node.js)",
                                company: "Pracify",
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 9,
                    top: 9,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF999999),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        size: 19,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 36,
                    left: size.width * 0.04,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Circle(
                        url: kProfilePicURL,
                        width: size.width * 0.27,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 112,
                    left: 96,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 21,
                      width: 21,
                      child: Container(
                        height: 18,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF2f7643)),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 9, top: 99, child: Icon(Icons.create_outlined)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({Key key, this.title, this.image, this.company})
      : super(key: key);

  final title;
  final company;
  final image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Image.network(
            image,
            width: size.width * 0.13,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  company,
                  style: TextStyle(fontSize: 12, color: Color(0xFF868686)),
                ),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.circle,
                  size: 3.6,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Internship",
                  style: TextStyle(fontSize: 12, color: Color(0xFF868686)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({Key key, this.text}) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.02,
            ),
            Circle(
              url: kProfilePicURL,
              width: size.width * 0.12,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sai replied to a comment",
                  style: TextStyle(fontSize: 13.6),
                )
              ],
            )
          ],
        ));
  }
}

class Item extends StatelessWidget {
  const Item({Key key, this.icon, this.title, this.description})
      : super(key: key);

  final icon;
  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(child: icon),
        SizedBox(
          width: 10,
        ),
        Container(
          width: size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 11.5, color: Color(0xFF999999)),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Views extends StatelessWidget {
  const Views({Key key, this.text, this.count}) : super(key: key);

  final text;
  final count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 0.4, color: Color(0xFF999999)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$count",
              style: TextStyle(
                  color: Color(0xFF0d66c3), fontWeight: FontWeight.bold),
            ),
            Container(
              height: 27,
              child: Text(
                text,
                style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
