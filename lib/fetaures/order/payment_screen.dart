import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> paymentMethods = [
    {
      "name": "Visa",
      "image": "https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg"
    },
    {
      "name": "Mastercard",
      "image": "https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg"
    },
    {
      "name": "Paypal",
      "image": "https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg"
    },
    {
      "name": "Apple Pay",
      "image": "https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Payment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 8),

            const Text(
              "Choose your payment method",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 18),

            Expanded(
              child: ListView.separated(
                itemCount: paymentMethods.length,
                separatorBuilder: (c, i) => const SizedBox(height: 30),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? AppColors.primary : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          // Network Image for logos
                          SvgPicture.network(
                            paymentMethods[index]["image"]!,
                            height: 34,
                            width: 34,
                            placeholderBuilder: (context) => const SizedBox(
                              height: 34,
                              width: 34,
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            ),
                          ),


                          const SizedBox(width: 12),

                          // Prevent overflow
                          Expanded(
                            child: Text(
                              paymentMethods[index]["name"]!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Checkmark with animation
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: isSelected ? 1 : 0,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIndex == -1 ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
