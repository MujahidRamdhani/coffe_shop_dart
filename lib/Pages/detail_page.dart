import 'package:coffe_shop_flutter/models/coffee.dart';
import 'package:coffe_shop_flutter/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.coffee});
  final Coffee coffee;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String sizeSelected = "M";

  @override
  Widget build(BuildContext context) {
    //  print("Nama: ${widget.coffee.image}, Harga: ${widget.coffee.price}");
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 68),
          buildHeader(),
          const SizedBox(height: 24),
          buidImage(),
          SizedBox(height: 24),
          buildMainInfo(),
          SizedBox(height: 20),
          buildDescription(),
          SizedBox(height: 30),
          buildSized(),
          SizedBox(height: 24),
          buildPrice(),
        ],
      ),
      // bottomNavigationBar: buildPrice(),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const ImageIcon(
            AssetImage('assets/ic_arrow_left.png'),
          ),
        ),
        const Text(
          'Detail',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff242424)),
        ),
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage('assets/ic_heart_border.png'),
          ),
        ),
      ],
    );
  }

  Widget buidImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(widget.coffee.image,
          width: double.infinity, height: 202, fit: BoxFit.cover),
    );
  }

  Widget buildMainInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'asdasdsaaaaaaaaaaasdasdasd',
          widget.coffee.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff242424),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  widget.coffee.type,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xffA2A2A2),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Image.asset(
                      'assets/ic_star_filled.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.coffee.rate.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff242424),
                      ),
                    ),
                    const SizedBox(width: 1),
                    Text(
                      '(${widget.coffee.review})',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xff242424),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                'assets/bike.png',
                'assets/bean.png',
                'assets/milk.png',
              ].map((e) {
                return Container(
                  margin: const EdgeInsets.only(left: 12),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xffEDEDED).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    e,
                    height: 24,
                    width: 24,
                  ),
                );
              }).toList(),
            )
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            color: Color(0xffE3E3E3),
            height: 1,
            thickness: 1,
          ),
        )
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff242424),
          ),
        ),
        const SizedBox(height: 8),
        ReadMoreText(
          widget.coffee.description,
          trimLength: 110,
          trimMode: TrimMode.Length,
          trimCollapsedText: ' Read More',
          trimExpandedText: ' Read Less',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Color(0xff424242),
          ),
          moreStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffC67C4E),
          ),
          lessStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xffC67C4E),
          ),
        )
      ],
    );
  }

  Widget buildSized() {
    final sizes = ['S', 'M', 'L'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        // SizedBox(height: 8),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: sizes.map((size) {
            bool isSelected = sizeSelected == size;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    sizeSelected = size;
                  });
                },
                child: Container(
                  height: 41,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: isSelected ? Color(0xffF9F2ED) : Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(isSelected ? 0xffC67C4E : 0xffE3E3E3),
                        width: 1,
                      )),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  alignment: Alignment.center,
                  child: Text(
                    size,
                    style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        fontSize: 14,
                        color: Color(isSelected ? 0xffC67C4E : 0xff242424)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

   Widget buildPrice() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Price',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Color(0xff909090),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  NumberFormat.currency(
                    decimalDigits: 2,
                    locale: 'en_US',
                    symbol: '\$ ',
                  ).format(widget.coffee.price),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xffC67C4E),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 217,
            child: ButtonPrimary(
              title: 'Buy Now',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
