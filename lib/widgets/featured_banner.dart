import 'package:flutter/material.dart';

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 220,

      width: double.infinity,

      decoration: BoxDecoration(

        borderRadius:
            BorderRadius.circular(28),

        image: const DecorationImage(

          image: NetworkImage(
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1200',
          ),

          fit: BoxFit.cover,
        ),
      ),

      child: Container(

        padding:
            const EdgeInsets.all(22),

        decoration: BoxDecoration(

          borderRadius:
              BorderRadius.circular(28),

          gradient: LinearGradient(

            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

            colors: [

              Colors.black.withOpacity(0.78),

              Colors.transparent,
            ],
          ),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          mainAxisAlignment:
              MainAxisAlignment.end,

          children: [

            Container(

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),

              decoration: BoxDecoration(

                color: Colors.orange,

                borderRadius:
                    BorderRadius.circular(20),
              ),

              child: const Text(
                'Featured',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(

              'Authentic Ethiopian Recipes',

              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 8),

            const Text(

              'Discover delicious traditional meals and cooking guides.',

              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(

              height: 42,

              child: ElevatedButton(

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange,

                  foregroundColor:
                      Colors.white,
                ),

                onPressed: () {},

                child: const Text(
                  'Explore Recipes',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}