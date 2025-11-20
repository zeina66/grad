import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_bottom_nav.dart';
import 'package:graduation_project/fetaures/order/payment_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedTab = 0; // 0 = Unpaid, 1 = Paid, 2 = Schedule

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buildTabButton("Unpaid", 0),
                const SizedBox(width: 8),
                buildTabButton("Paid", 1),
                const SizedBox(width: 8),
                buildTabButton("Schedule", 2),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: IndexedStack(
                index: selectedTab,
                children: [
                  unpaidScreen(),
                  paidScreen(),
                  scheduleScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- TAB BUTTON ----------------
  Widget buildTabButton(String text, int index) {
    final bool active = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primary,
              width: 1.4,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- UNPAID SCREEN ----------------
  Widget unpaidScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "You have not paid yet for below service",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textDark),
        ),
        const SizedBox(height: 15),

        orderCard(
          title: "Plumbing",
          price: "\$200.00",
          date: "December 23, 2023",
          workerName: "Amr Waleed",
          actionText: "Pay now",
          actionColor: Colors.green,

          titleStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
          priceStyle: const TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          dateStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          workerStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
          actionStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          onAction: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PaymentScreen()),
            );
          },
        ),
      ],
    );
  }

  // ---------------- PAID SCREEN ----------------
  Widget paidScreen() {
    return ListView(
      children: [
        orderCard(
          title: "Plumbing",
          price: "\$300.00",
          date: "December 24, 2023",
          workerName: "Amr Waleed",

          titleStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
          priceStyle: const TextStyle(
            fontSize: 20,
            color: Colors.green,fontWeight: FontWeight.bold
          ),
          dateStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          workerStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
          actionStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          actionColor: AppColors.primary,
        ),

        orderCard(
          title: "Electrical Work",
          price: "\$600.00",
          date: "December 07, 2023",
          workerName: "Ahmed Ali",

          titleStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
          priceStyle: const TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          dateStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          workerStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
          actionStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          actionColor: AppColors.primary,
        ),
      ],
    );
  }

  // ---------------- SCHEDULE SCREEN ----------------
  Widget scheduleScreen() {
    return ListView(
      children: [
        orderCard(
          title: "Electrical Work",
          price: "\$30/H",
          date: "January 04, 2024",
          time: "10:00AM",
          workerName: "Sara Tarek",
          actionText: "Cancel Booking",
          actionColor: Colors.redAccent,
          onAction: () {},

          titleStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
          priceStyle: const TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          dateStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          workerStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
          actionStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),

        orderCard(
          title: "Carpentering",
          price: "\$20/H",
          date: "January 10, 2024",
          time: "11:00AM",
          workerName: "Nour Hassan",
          actionText: "Cancel Booking",
          actionColor: Colors.redAccent,
          onAction: () {},

          titleStyle: const TextStyle(
            fontSize: 20,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
          ),
          priceStyle: const TextStyle(
            fontSize: 20,
            color: Colors.green,fontWeight: FontWeight.bold
          ),
          dateStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          workerStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.primary,
          ),
          actionStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // ---------------- ORDER CARD ----------------
  Widget orderCard({
    required String title,
    required String price,
    required String date,
    required String workerName,
    String? time,
    String? actionText,
    Color? actionColor,
    VoidCallback? onAction,
    required TextStyle titleStyle,
    required TextStyle priceStyle,
    required TextStyle dateStyle,
    required TextStyle workerStyle,
    required TextStyle actionStyle,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("🧑‍🔧", style: TextStyle(fontSize: 22)),
                const SizedBox(width: 8),
                Text(title, style: titleStyle),
              ],
            ),

            const SizedBox(height: 10),

            infoRow("Amount to pay", price, customStyle: priceStyle),
            infoRow("Booking date", date, customStyle: dateStyle),

            if (time != null)
              infoRow("Arrival time", time, customStyle: dateStyle),

            infoRow("Worker name", workerName,
                isLink: true, customStyle: workerStyle),

            if (actionText != null) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actionColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(actionText, style: actionStyle),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  // ---------------- INFO ROW ----------------
  Widget infoRow(
      String label,
      String value, {
        bool isLink = false,
        TextStyle? customStyle,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black54),
          ),
          Text(
            value,
            style: customStyle ??
                TextStyle(
                  color: isLink ? Colors.blue : Colors.black87,
                  fontWeight: isLink ? FontWeight.bold : FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
