
import 'package:flutter/material.dart';



class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.description,
     this.category,
     this.price,
     this.discountPercentage,
    this.rating,
     this.stock,
     this.tags,
     this.brand,
  });

  final String thumbnail;
  final String title;
  final String description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  // final String? sku;
  // final int? weight;
  // final Dimensions? dimensions;
  // final String? warrantyInformation;
  // final String? shippingInformation;
  // final String? availabilityStatus;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                thumbnail,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            /// Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            /// Brand + Category
            Row(
              children: [
                Chip(
                  label: Text(brand ?? ""),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(category ?? ""),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              description,
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 12),

            /// Price Row
            Row(
              children: [
                Text(
                  "\$$price",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "-$discountPercentage%",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(rating.toString()),
                const Spacer(),
                Text(
                  "Stock: $stock",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const Divider(height: 24),

            // infoTile(
            //   Icons.inventory_2,
            //   "Availability",
            //   product["availabilityStatus"],
            // ),
            //
            // infoTile(
            //   Icons.local_shipping,
            //   "Shipping",
            //   product["shippingInformation"],
            // ),
            //
            // infoTile(
            //   Icons.verified,
            //   "Warranty",
            //   product["warrantyInformation"],
            // ),
            //
            // infoTile(
            //   Icons.qr_code,
            //   "SKU",
            //   product["sku"],
            // ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              children: (tags as List)
                  .map(
                    (e) => Chip(
                  label: Text(e.toString()),
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}