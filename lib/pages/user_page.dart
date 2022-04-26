import 'package:cadastro/components/busca.dart';
import 'package:cadastro/controller/user_controller.dart';
import 'package:cadastro/models/user_model.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuaruos'),
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
      body: FutureBuilder<List<Data>>(
          future: UserController().getData(query: ''),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data![index].avatar.toString(),
                        ),
                      ),
                      title: Text(
                        snapshot.data![index].firstName.toString(),
                      ),
                      subtitle: Text(
                        snapshot.data![index].email.toString(),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
