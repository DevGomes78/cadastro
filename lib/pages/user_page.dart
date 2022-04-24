import 'package:cadastro/components/search.dart';
import 'package:cadastro/controller/call_api.dart';
import 'package:cadastro/models/user_model.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  DataUser userList = DataUser();

  @override
  void initState() {
    super.initState();
    DataUser().getUserList(query: 'query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: BuscaUsuario(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: FutureBuilder<List<UserModel>>(
            future: DataUser().getUserList(query: ''),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data![index].name.toString(),
                        ),
                        subtitle: Text(
                          snapshot.data![index].email.toString(),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
