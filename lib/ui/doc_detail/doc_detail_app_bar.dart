import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../util/dbhelper.dart';

const menuDelete = 'Delete';
final List<String> menuOptions = const <String>[menuDelete];

class DocDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  Doc doc;
  final DbHelper dbh = DbHelper();

  DocDetailAppBar(this.doc);

  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(this.doc.title == "" ? "New Doc" : this.doc.title),
        actions: (this.doc.title == "")
            ? <Widget>[]
            : <Widget>[
                PopupMenuButton(
                  onSelected: _selectMenu,
                  itemBuilder: (BuildContext context) {
                    return menuOptions.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ]);
  }

  void _selectMenu(String value) async {
    switch (value) {
      case menuDelete:
        if (this.doc.id == -1) {
          return;
        }
        await _deleteDoc(this.doc.id);
    }
  }

  void _deleteDoc(int id) async {
    int r = await this.dbh.deleteDoc(this.doc.id);
    // Navigator.pop(context, true);
  }
}
