import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String eventId,
      eventName,
      eventDetails,
      eventDate,
      eventLocation,
      eventAddress,
      eventHeader;

  Event(this.eventId, this.eventName, this.eventDetails, this.eventDate,
      this.eventLocation, this.eventAddress, this.eventHeader);

  factory Event.fromFirestore(DocumentSnapshot event) {
    Map data = event.data;

    return Event(
        event.documentID,
        data['event_name'] ?? '',
        data['event_details'] ?? '',
        data['event_date'] ?? '',
        data['event_location'] ?? '',
        data['event_address'] ?? '',
        data['event_header'] ?? '');
  }
}
