import 'package:coffe_shop_flutter/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String categorySelected = 'All coffee';
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            buildBackground(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 68),
                  buildHeader(),
                  const SizedBox(height: 24),
                  buildSearch(),
                  const SizedBox(height: 24),
                  buildBannerPromo(),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 24),
        buildCategories(),
        SizedBox(height: 24),
        buildGridCoffee(),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff111111),
            Color(0xff313131),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Localtion',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color(0xffA2A2A2),
            height: 1.5,
          ),
        ),
        Row(
          children: [
            const Text(
              'Bilzen, Tanjungbalai',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xffD8D8D8),
                height: 1.5,
              ),
            ),
            // ImageIcon(AssetImage('assets/ic_ar'))
            const SizedBox(width: 8),
            Image.asset(
              'assets/ic_arrow_down.png',
              width: 14,
              height: 14,
            )
          ],
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff2A2A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            child: const Row(
              children: [
                // Image.asset('')
                ImageIcon(
                  AssetImage('assets/ic_search.png'),
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search Coffe',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: const Color(0xffC67C4E),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage('assets/ic_filter.png'),
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget buildBannerPromo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/banner.png',
        width: double.infinity,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCategories() {
    final categories = [
      'All coffee',
      'Cappuccino',
      'Machiato',
      'Espresso',
      'Americano'
    ];
    return SizedBox(
      height: 29,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String category = categories[index];
          bool isActive = categorySelected == category;
          return GestureDetector(
            onTap: () {
              categorySelected = category;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 24 : 8,
                right: index == categories.length - 1 ? 24 : 8,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? Color(0xffC67C4E)
                    : Color(0xffEDEDED).withOpacity(0.35),
                //  color: Color(0xffC67C4E),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 14,
                  color: isActive ? Colors.white : const Color(0xff313131),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridCoffee() {
    return GridView.builder(
      itemCount: listGridCoffee.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 238,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Coffee coffee = listGridCoffee[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail', arguments: coffee);
            // print(coffee);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        coffee.image,
                        height: 128,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              const Color(0xff111111).withOpacity(0.3),
                              const Color(0xff313131).withOpacity(0.3),
                            ],
                          ),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(24)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/ic_star_filled.png',
                              height: 12,
                              width: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${coffee.rate}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 8),
                Text(
                  '${coffee.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff242424),
                    height: 1.5,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '${coffee.type}',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Color(0xff242424),
                    height: 1.5,
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                              decimalDigits: 2, locale: 'en_US', symbol: '\$')
                          .format(coffee.price),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff242424),
                        height: 1.5,
                      ),
                    ),
                    // const SizedBox(width: 16),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          color: const Color(0xffC67C4E),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
