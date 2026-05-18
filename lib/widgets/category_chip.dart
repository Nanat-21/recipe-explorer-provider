import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {

  final String title;

  final bool isSelected;

  final VoidCallback onTap;

  const CategoryChip({

    super.key,

    required this.title,

    required this.isSelected,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding:
          const EdgeInsets.only(
        right: 12,
      ),

      child: GestureDetector(

        onTap: onTap,

        child: AnimatedContainer(

          duration:
              const Duration(
            milliseconds: 250,
          ),

          padding:
              const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),

          decoration: BoxDecoration(

            color: isSelected

                ? Colors.orange

                : Colors.white,

            borderRadius:
                BorderRadius.circular(
              22,
            ),

            boxShadow: [

              BoxShadow(

                color: Colors.black
                    .withOpacity(
                  0.05,
                ),

                blurRadius: 8,
              ),
            ],
          ),

          child: Text(

            title,

            style: TextStyle(

              color: isSelected

                  ? Colors.white

                  : Colors.black87,

              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}