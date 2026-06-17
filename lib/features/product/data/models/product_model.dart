import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product_detail_entity.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductDetailsEntity toEntity() {
    return ProductDetailsEntity(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      rating: rating,
      images: images,
      thumbnail: thumbnail,
    );
  }
}
