import 'package:flutter/material.dart';

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: const NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('title',style: TextStyle(color: Colors.black, fontSize: 20)),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 10),
                  child: Text(
                    'title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title title itle title title title title title title title ',
                    maxLines: 2,
                    style: TextStyle(color: Colors.black, fontSize: 15)
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}