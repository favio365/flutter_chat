import '../database.dart';

class ChatMessageTable extends SupabaseTable<ChatMessageRow> {
  @override
  String get tableName => 'chat_message';

  @override
  ChatMessageRow createRow(Map<String, dynamic> data) => ChatMessageRow(data);
}

class ChatMessageRow extends SupabaseDataRow {
  ChatMessageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessageTable();

  String get chatMessageId => getField<String>('chat_message_id')!;
  set chatMessageId(String value) => setField<String>('chat_message_id', value);

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
