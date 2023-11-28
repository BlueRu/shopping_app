import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Bottom Favorite Sheet

class BottomFavoriteSheet extends StatelessWidget {
  const BottomFavoriteSheet({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 600,
        padding: EdgeInsets.all(20),
        color: Colors.blue[100],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 1; i < 3; i++)
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF475269).withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "itemPage");
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 0, right: 60),
                                      height: 90,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF475269),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      child: Image.asset(
                                        "assets/$i.png",
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Nike Shoe",
                                      style: TextStyle(
                                        color: Color(0xFF475269),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF475269)
                                                    .withOpacity(0.3),
                                                blurRadius: 5,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Icon(CupertinoIcons.minus,
                                              size: 18),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text("1",
                                              style: TextStyle(
                                                color: Color(0xFF475269),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF475269)
                                                    .withOpacity(0.3),
                                                blurRadius: 5,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Icon(CupertinoIcons.plus,
                                              size: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.purple
                                                  .withOpacity(0.4),
                                              blurRadius: 5,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$50",
                                      style: TextStyle(
                                        color: Color(0xFF475269),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
