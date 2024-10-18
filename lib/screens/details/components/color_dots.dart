import 'package:flutter/material.dart';

import '../../../components/rounded_icon_btn.dart';
import '../../../constants.dart';
import '../../../models/product.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
    this.minCount = 1,
    this.maxCount = 9,
    this.itemCount
  }) : super(key: key);

  final Product product;
  final int minCount;
  final int maxCount;
  final ItemCount? itemCount;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 0;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount != null) {setState(() {
      count = widget.itemCount!.count;
    });}
    final ItemCount thisItemCount = widget.itemCount ?? ItemCount();
    thisItemCount.count = count;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              isSelected: index == selectedColor,
              selectThis: () {
                setState(() {
                  selectedColor = index;
                });
              }
            ),
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: count > widget.minCount ? () {
              setState(() {
                if (count > widget.minCount) {
                  count--;
                  if (widget.itemCount != null) widget.itemCount!.count = count;
                }
              });
            } : null,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            child: Text(
              '$count',
              textAlign: TextAlign.center
            )
          ),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: count < widget.maxCount ? () {
              setState(() {
                if (count < widget.maxCount) {
                  count++;
                  if (widget.itemCount != null) widget.itemCount!.count = count;
                }
              });
            } : null,
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
    this.selectThis
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final GestureTapCallback? selectThis;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectThis,
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 2),
        padding: const EdgeInsets.all(8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border:
              Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class ItemCount {
  int count;
  ItemCount({
    this.count = 1
  });
}
