import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_category.dart';
import '../../../core/widgets/custom_list card.dart';
import '../../../core/widgets/text f.dart';
import '../data/repo/product_data.dart';

class HomePage extends StatefulWidget {
  final String? name;

  const HomePage({super.key, this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selcetionindex = 0;

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final userName = args?['name'] ?? 'Guest';

    List<String> categoray = ['Hottest', 'Popular', 'New combo', 'Top'];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Header (Menu + Basket) =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppAssets.menu),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Column(
                        children: [
                          SvgPicture.asset(AppAssets.shoppingBasket),
                          const SizedBox(height: 4),
                          const Text(
                            'MY Basket',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

               
                Text(
                  'Hello $userName, what fruit salad\ncombo do you want today?',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: searchController,
                          radius: 16,
                          hintText: 'Search for fruit salad combos',
                          backgroundColor: const Color(0xFFF3F4F9),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF86869E),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAssets.search),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

               
                const Text(
                  'Recommended Combo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                
                Row(
                  children: [
                    CustomCard(
                      title: 'Honey lime combo',
                      price: '2000',
                      image: AppAssets.honeyLime,
                    ),
                    const SizedBox(width: 80),
                    CustomCard(
                      title: 'Berry mango combo',
                      price: '8000',
                      image: AppAssets.barry,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoray.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 16),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        selcetionindex = index;
                        setState(() {});
                      },
                      child: CustomCategory(
                        isActive: selcetionindex == index,
                        title: categoray[index],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 175,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: productdata.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 16),
                    itemBuilder: (context, index) => CustomList(
                      productModel: productdata[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
