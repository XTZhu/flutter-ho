import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DateSelectItemWidget extends StatefulWidget {
  final int start;
  final int end;
  final String unit;

  const DateSelectItemWidget(
      {Key key, this.start = 2020, this.end = 2120, this.unit = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DateSelectItemWidgetState();
  }
}

class _DateSelectItemWidgetState extends State<DateSelectItemWidget> {
  SwiperController yearSwiperController = new SwiperController();

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    Future.delayed(const Duration(milliseconds: 100), () {
      yearSwiperController.move(now.year - 2020, animation: true);
    });
  }

  int yearindex = 0;

  @override
  void dispose() {
    yearSwiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      margin: EdgeInsets.all(0),
      child: Swiper(
        viewportFraction: 0.35,
        itemHeight: 22,
        loop: true,
        controller: yearSwiperController,
        itemWidth: 60,
        itemCount: widget.end - widget.start + 1,
        scrollDirection: Axis.vertical,
        onIndexChanged: (index) {
          this.yearindex = index;
        },
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "${widget.start + index}${widget.unit}",
              style: this.yearindex == index
                  ? TextStyle(
                      color: Color.fromRGBO(21, 21, 21, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700)
                  : TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(162, 161, 169, 1),
                    ),
            ),
          );
        },
      ),
    );
  }
}
