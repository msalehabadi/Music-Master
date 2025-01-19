import 'package:flutter/material.dart';

class PremiumPurchaseScreen extends StatelessWidget {
  const PremiumPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Go Premium',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // White back button
      ),
      body: SingleChildScrollView(
        // Fixes bottom overflow error
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Text
              const Text(
                'Unlock the full experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enjoy all the benefits of Premium and support the artists you love.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Features List with Bullet Points
              _buildFeatureList(),
              const SizedBox(height: 30),

              // Pricing Cards
              _buildPricingCards(context),
              const SizedBox(height: 20),

              // Terms and Conditions
              const Center(
                child: Text(
                  'Terms and conditions apply.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Feature List with Bullet Points
  Widget _buildFeatureList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureItem('Ad-free listening'),
        _buildFeatureItem('Download songs for offline playback'),
        _buildFeatureItem('Unlimited skips and search ability'),
        _buildFeatureItem('High-quality audio'),
        _buildFeatureItem('Exclusive content and early releases'),
      ],
    );
  }

  // Individual Feature Item with Bullet Point
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.pink, // Pink checkmark
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Pricing Cards
  Widget _buildPricingCards(BuildContext context) {
    return Column(
      children: [
        _buildPricingCard(
          context,
          title: '1 Month',
          price: '\$9.99',
          description: 'Billed monthly. Cancel anytime.',
        ),
        const SizedBox(height: 20),
        _buildPricingCard(
          context,
          title: '12 Months',
          price: '\$99.99',
          description: 'Billed annually. Save 20%.',
          isRecommended: true,
        ),
      ],
    );
  }

  // Individual Pricing Card
  Widget _buildPricingCard(
    BuildContext context, {
    required String title,
    required String price,
    required String description,
    bool isRecommended = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
        border: isRecommended
            ? Border.all(color: Colors.purple, width: 2) // Purple border
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRecommended)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.purple, // Purple background
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'RECOMMENDED',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink, // Pink price text
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle purchase logic
              print('$title plan selected');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink, // Pink button
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'GET STARTED',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}