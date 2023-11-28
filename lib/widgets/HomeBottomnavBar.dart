import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_board_app/pages/categories_page.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'BottomCartSheet.dart';
import 'BottomFavoriteSheet.dart';

class HomeBottomnavBar extends StatelessWidget {
  const HomeBottomnavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF475269),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            },
            child: Icon(
              Icons.category_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {
              showSlidingBottomSheet(
                context,
                builder: (context) {
                  return SlidingSheetDialog(
                      elevation: 8,
                      cornerRadius: 16,
                      builder: (context, state) {
                        return BottomCartSheet();
                      });
                },
              );
            },
            child: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 32,
            ),
          ),

          // Icon(
          //   Icons.favorite,
          //   color: Colors.white,
          //   size: 32,
          // ),
          InkWell(
            onTap: () {
              showSlidingBottomSheet(
                context,
                builder: (context) {
                  return SlidingSheetDialog(
                    elevation: 8,
                    cornerRadius: 16,
                    builder: (context, state) {
                      return BottomFavoriteSheet();
                    },
                  );
                },
              );
            },
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 32,
            ),
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 32,
          )
        ],
      ),
    );
  }
}
