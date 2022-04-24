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
    DataUser().getUser(query: 'query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
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
        child: FutureBuilder<List<UserModel>?>(
            future: DataUser().getUser(query: ''),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data![index]
                                .owner!.avatarUrl.toString(),),
                          ),
                          title: Text(
                      snapshot.data![index].name.toString(),
                      ),
                      subtitle: Text(
                      snapshot.data![index].htmlUrl.toString(),
                      )
                      ,
                      );
                    });
              }
            }),
      ),
    );
  }
}
