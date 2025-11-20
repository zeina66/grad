import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/assets.dart';
import 'package:graduation_project/core/widgets/custom_bottom_nav.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import '../widgets/banner_card.dart';
import '../widgets/popular_service_card.dart';
import '../widgets/service_provider_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 60),
                    child: BannerCard(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),




                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search here..',
                          hintStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.primary,
                            size: 24,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune,
                            color: AppColors.primary,
                            size: 24,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white38,
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const SliverToBoxAdapter(child: SizedBox(height: 20)),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Popular services',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(color: AppColors.primary, fontSize: 17, fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),
            ),


        SliverToBoxAdapter(
          child: SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: const [
                Center(
                  child: PopularServiceCard(
                    imagePath: AppAssets.test1,
                    title: 'Plumbing',
                    imageSize: 90,
                    textStyle: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                ),

                Center(child: PopularServiceCard(
                  imagePath: AppAssets.test2,
                  title: 'Electrical work',
                  imageSize: 200,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),

                ),


                Center(
                  child: PopularServiceCard(
                    imagePath: AppAssets.test4,
                    title: ' Carpentering',
                    imageSize: 60,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                Center( child: PopularServiceCard(
                  imagePath: AppAssets.test3,
                  title: ' Air Condition',
                  imageSize: 60,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),

                ),
                Center(
                  child: PopularServiceCard(
                    imagePath: AppAssets.test5,
                    title: ' Repairs',
                    imageSize: 90,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),


            const SliverToBoxAdapter(child: SizedBox(height: 5)),


            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Service Providers',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 9,
                  childAspectRatio: 0.70,
                ),
                delegate: SliverChildListDelegate(
                  const [
                    ServiceProviderCard(
                        name: 'Amr Waleed', job: 'Plumber', rating: 4.8, imagePath: AppAssets.test6,),
                    ServiceProviderCard(
                        name: 'Ahmed Ali', job: 'Electrician', rating: 4.7, imagePath: AppAssets.test7,),
                    ServiceProviderCard(
                        name: 'Sara Tarek', job: 'technician ', rating: 4.9, imagePath: AppAssets.test8,),
                    ServiceProviderCard(
                        name: 'Nour Hassan', job: 'technician ', rating: 4.6, imagePath: AppAssets.test9,),
                    ServiceProviderCard(
                      name: 'Omar Elhenawy', job: 'Plumber', rating: 4.6, imagePath: AppAssets.test10,),
                    ServiceProviderCard(
                      name: 'Roshdy Mohamed', job: 'carpenter', rating: 4.6, imagePath: AppAssets.test11,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
