import 'package:flutter/material.dart';
import 'package:flutter_basic/model/ad.dart';

class AdCard extends StatefulWidget {

  Ad _ad;

  AdCard(Ad ad) {
    this._ad = ad;
  }

  @override
  _AdCardState createState() => _AdCardState(_ad);
}

///
/// 광고 보여주는 카드 위젯
///
/// 1. 파라미터로 영화 이름을 전달 받음
/// 2. 전달받은 이름으로 광고를 네트워크로 받아옴
/// 3. 받아온 정보로 카드를 장식
/// 4. 상세보기 누르면 받아온 정보와 함께 상세보기 페이지로 이동
///
class _AdCardState extends State<AdCard> {

  Ad _ad;

  _AdCardState(Ad ad) {
    this._ad = ad;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(_ad.imageUrl),
          Container(
            padding: EdgeInsets.all(9.5),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(_ad.subImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '아카데미가 사랑한 네 자매',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '작은 아씨들',
                        style: TextStyle(
                            color: Colors.black54
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                OutlineButton(
                  onPressed: () => print('hello'),
                  splashColor: Color.fromARGB(255, 206, 140, 74),
                  highlightedBorderColor: Color.fromARGB(255, 206, 140, 74),
                  child: Text('상세보기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
