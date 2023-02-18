import '../database.dart';

class ChatTable extends SupabaseTable<ChatRow> {
  @override
  String get tableName => 'chat';

  @override
  ChatRow createRow(Map<String, dynamic> data) => ChatRow(data);
}

class ChatRow extends SupabaseDataRow {
  ChatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatTable();

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool get isGroup => getField<bool>('is_group')!;
  set isGroup(bool value) => setField<bool>('is_group', value);

  String? get groupName => getField<String>('group_name');
  set groupName(String? value) => setField<String>('group_name', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageTime => getField<DateTime>('last_message_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('last_message_time', value);

  String? get lastMessageSendBy => getField<String>('last_message_send_by');
  set lastMessageSendBy(String? value) =>
      setField<String>('last_message_send_by', value);
}
