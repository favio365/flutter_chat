import '../backend/supabase/supabase.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_chat_room_model.dart';
export 'my_chat_room_model.dart';

class MyChatRoomWidget extends StatefulWidget {
  const MyChatRoomWidget({
    Key? key,
    this.chatRoom,
    this.user,
  }) : super(key: key);

  final String? chatRoom;
  final String? user;

  @override
  _MyChatRoomWidgetState createState() => _MyChatRoomWidgetState();
}

class _MyChatRoomWidgetState extends State<MyChatRoomWidget> {
  late MyChatRoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyChatRoomModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: FutureBuilder<List<UserRow>>(
          future: UserTable().querySingleRow(
            queryFn: (q) => q.eq(
              'user_id',
              widget.user,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            List<UserRow> textUserRowList = snapshot.data!;
            final textUserRow =
                textUserRowList.isNotEmpty ? textUserRowList.first : null;
            return Text(
              valueOrDefault<String>(
                textUserRow?.name,
                'Nombre',
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            );
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<List<ChatMessageRow>>(
                  future: ChatMessageTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'chat_id',
                          widget.chatRoom,
                        )
                        .order('created_at'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ChatMessageRow> listViewChatMessageRowList =
                        snapshot.data!;
                    if (listViewChatMessageRowList.isEmpty) {
                      return Center(
                        child: EmptyListWidget(),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatMessageRowList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatMessageRow =
                            listViewChatMessageRowList[listViewIndex];
                        return Stack(
                          children: [
                            if (listViewChatMessageRow.chatId == widget.user)
                              Text(
                                listViewChatMessageRow.message,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            if (listViewChatMessageRow.chatId != widget.user)
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Text(
                                  listViewChatMessageRow.message,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _model.textController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      await ChatMessageTable().insert({
                        'chat_id': widget.chatRoom,
                        'user_id': widget.user,
                        'message': _model.textController.text,
                      });
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      await ChatMessageTable().insert({
                        'chat_id': widget.chatRoom,
                        'user_id': FFAppState().favioId,
                        'message': _model.textController.text,
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
