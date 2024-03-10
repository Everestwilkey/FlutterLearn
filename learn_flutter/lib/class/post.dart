class Post {
  final String id; // Assuming there's an _id field from MongoDB
  final String title;
  final String content;
  final double price; // Dart uses double for floating-point numbers
  final String
      item; // For simplicity, we'll keep this as String. You might want to convert this to an enum in Dart as well.// ID of the user who created the post

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.price,
    required this.item,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'], // MongoDB's default ID field
      title: json['title'],
      content: json['content'],
      price: (json['price'] as num).toDouble(), // Ensure conversion to double
      item: json[
          'item'], // Depending on your implementation, you might want to convert this to an enum // Assuming this comes as a stringified ObjectId
    );
  }
}
