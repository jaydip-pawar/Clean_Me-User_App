import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xFF051106),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 0,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 110,
                  child: Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF1F1D1D),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          SizedBox(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Material(
                    child: Container(
                      height: 180.0,
                      width: width * 10,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 170,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/Team.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 240,
                  child: Container(
                    height: 150,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Team Zeus",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Introduces you to",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(color: Colors.white),
                        Text(
                          "KudaCam App",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 200,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF051106),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(80.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF051106).withOpacity(0.3),
                              offset: new Offset(-10.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 50.0,
                        bottom: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "Aim:",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 22),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Dream for a Zero Solid Waste City",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 200,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF051106),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(80.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF051106).withOpacity(0.3),
                              offset: new Offset(-10.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 50.0,
                        bottom: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "Problem Statement : ",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 22),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            " A solution which  can help municipal bodies maximize solid waste collection with their given resources.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 200,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF051106),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(80.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF051106).withOpacity(0.3),
                              offset: new Offset(-10.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 50.0,
                        bottom: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "Our Team : ",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 22),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            " At CudaCam, our team is building a platform that enables people to contribute and help the Local Bodies for keeping the Cities Clean/Litter Free"
                                ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 25),
                    height: 200,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF051106),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(80.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF051106).withOpacity(0.3),
                              offset: new Offset(-10.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 50.0,
                        bottom: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            "Future Tie-Ups: ",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 22),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Through the Enthusiasm  of a Hardworking Workers  & brilliant partners, we hope to see  governments, corporations, NGOs, schools, & individuals use this App that help systemically reduce litter."
                            ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
