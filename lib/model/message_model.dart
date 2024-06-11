class Message {
  final String message;
  final String id;
  final String to;
  Message(this.message, this.id,  this.to);
  factory Message.fromjeson(data) {
    return Message(data['message'], data['id'],data['imageUrl']);
  }
}
