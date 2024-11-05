class Booking {
  final String id;
  final String address;
  final String bookingStatus;
  final String creatorId;
  final double latitude;
  final double longitude;
  final String package;
  final String price;
  final String time;

  Booking({
    required this.id,
    required this.address,
    required this.bookingStatus,
    required this.creatorId,
    required this.latitude,
    required this.longitude,
    required this.package,
    required this.price,
    required this.time,
  });

  // Factory constructor to create a Booking object from a JSON map
  factory Booking.fromMap(String id, Map<dynamic, dynamic> data) {
    return Booking(
      id: id,
      address: data['address'] ?? '',
      bookingStatus: data['booking_status'] ?? '',
      creatorId: data['creator_id'] ?? '',
      latitude: data['latitude'] ?? 0.0,
      longitude: data['longitude'] ?? 0.0,
      package: data['package'] ?? '',
      price: data['price'] ?? '',
      time: data['time'] ?? '',
    );
  }
}
