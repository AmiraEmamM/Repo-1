import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_pulse/core/config/resource/app_assets.dart';
import 'package:green_pulse/core/config/resource/app_size.dart';
import 'package:green_pulse/core/config/resource/app_styles.dart';

import '../../../../core/config/resource/colors_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CartBody());
  }
}

class CartBody extends StatelessWidget {
  CartBody({super.key});

  final List<String> filters = [
    'All',
    'veg',
    'fruits',
    'plants , seeds',
    'other',
  ];

  final List<Product> products = [
    Product(
      name: 'Pepper',
      size: '3 Inch',
      imagePath: AppImages.cart1,
      price: 25,
      rating: 5,
    ),
    Product(
      name: 'Basil',
      size: '5 Inch',
      imagePath: AppImages.cart2,
      price: 20,
      rating: 4,
    ),
    Product(
      name: 'Broccoli',
      size: '8 Inch',
      imagePath: AppImages.cart3,
      price: 15,
      rating: 3,
    ),
    Product(
      name: 'Starwberry',
      size: '8 Inch',
      imagePath: AppImages.cart4,
      price: 30,
      rating: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendations',
            style: AppStyles.semiBold15.copyWith(
              fontSize: FontSize.s18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.h),
          HorizontalCategoriesWidget(filters: filters),
          SizedBox(height: 16.h),
          Row(
            children: [
              const Text(
                'Popularity',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_downward_sharp,
                color: AppColors.green476C5F,
                size: 16.sp,
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:  1.17,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder:
                  (context, index) => ProductCard(product: products[index]),
            ),
          ),
          Image.asset(AppImages.banner),
        ],
      ),
    );
  }
}

class HorizontalCategoriesWidget extends StatefulWidget {
  const HorizontalCategoriesWidget({super.key, required this.filters});

  final List<String> filters;

  @override
  State<HorizontalCategoriesWidget> createState() =>
      _HorizontalCategoriesWidgetState();
}

class _HorizontalCategoriesWidgetState
    extends State<HorizontalCategoriesWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = currentIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary2 : AppColors.chipBg,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.filters[index],
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String size;
  final String imagePath;
  final double price;
  final double rating;

  Product({
    required this.name,
    required this.size,
    required this.imagePath,
    required this.price,
    required this.rating,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.veryLightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppIcons.favoriteIcon),
                  const Icon(
                    Icons.add_box_outlined,
                    color: AppColors.green476C5F,
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF095A1D),
                ),
              ),
              SizedBox(height: 6.h),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'From ${product.size}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 1.w,),
                    Text(
                      '${product.price.toInt()}\$',
                      style: const TextStyle(
                        color: Color(0xFF095A1D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 14,
                          color:
                              index < product.rating
                                  ? AppColors.rating
                                  : Colors.grey[300],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -40.h,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.veryLightBlue,
                  radius: 37.r,
                  child: Image.asset(product.imagePath),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
