class EventModel {
  final String id;
  final String title;
  final EventDate date;
  final List<String> address;
  final String link;
  final Venue venue;
  final String thumbnail;
  final List<TicketInfo> ticketInfo;
  final String description;
  final String location;
  final String eventType;
  final String serpApiId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  EventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.address,
    required this.link,
    required this.venue,
    required this.thumbnail,
    required this.ticketInfo,
    required this.description,
    required this.location,
    required this.eventType,
    required this.serpApiId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      date:
          json['date'] != null
              ? EventDate.fromJson(json['date'])
              : EventDate.empty(),
      address: List<String>.from(json['address'] ?? []),
      link: json['link'] ?? '',
      venue:
          json['venue'] != null ? Venue.fromJson(json['venue']) : Venue.empty(),
      thumbnail: json['thumbnail'] ?? '',
      ticketInfo:
          (json['ticketInfo'] as List?)
              ?.map((e) => TicketInfo.fromJson(e))
              .toList() ??
          [],
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      eventType: json['eventType'] ?? '',
      serpApiId: json['serpApiId'] ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json['updatedAt'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'date': date.toJson(),
      'address': address,
      'link': link,
      'venue': venue.toJson(),
      'thumbnail': thumbnail,
      'ticketInfo': ticketInfo.map((e) => e.toJson()).toList(),
      'description': description,
      'location': location,
      'eventType': eventType,
      'serpApiId': serpApiId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class EventDate {
  final String start;
  final String when;

  EventDate({required this.start, required this.when});

  factory EventDate.fromJson(Map<String, dynamic> json) {
    return EventDate(start: json['start'] ?? '', when: json['when'] ?? '');
  }

  factory EventDate.empty() => EventDate(start: '', when: '');

  Map<String, dynamic> toJson() => {'start': start, 'when': when};
}

class Venue {
  final String name;
  final String link;

  Venue({required this.name, required this.link});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(name: json['name'] ?? '', link: json['link'] ?? '');
  }

  factory Venue.empty() => Venue(name: '', link: '');

  Map<String, dynamic> toJson() => {'name': name, 'link': link};
}

class TicketInfo {
  final String source;
  final String link;
  final String id;

  TicketInfo({required this.source, required this.link, required this.id});

  factory TicketInfo.fromJson(Map<String, dynamic> json) {
    return TicketInfo(
      source: json['source'] ?? '',
      link: json['link'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'source': source, 'link': link, '_id': id};
}
