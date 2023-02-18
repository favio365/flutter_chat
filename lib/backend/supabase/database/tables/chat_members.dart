import '../database.dart';

class ChatMembersTable extends SupabaseTable<ChatMembersRow> {
  @override
  String get tableName => 'chat_members';

  @override
  ChatMembersRow createRow(Map<String, dynamic> data) => ChatMembersRow(data);
}

class ChatMembersRow extends SupabaseDataRow {
  ChatMembersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMembersTable();

  String get chatMembersId => getField<String>('chat_members_id')!;
  set chatMembersId(String value) => setField<String>('chat_members_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get chatId => getField<String>('chat_id')!;
  set chatId(String value) => setField<String>('chat_id', value);
}
