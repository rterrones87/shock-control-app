import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_control_app/data/menu_options_list.dart';
import 'package:school_control_app/models/menu_options.dart';
import 'package:school_control_app/presentation/shared/Newsletter_card_widget.dart';
import 'package:school_control_app/presentation/shared/menu_list_item_widget.dart';
import 'package:school_control_app/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SafeArea(
                child: Container(
              alignment: Alignment.centerRight,
              child: const CircleAvatar(
                backgroundImage: NetworkImage("https://github.com/twbs.png"),
              ),
            )),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text("Bienvenido, Rodolofo!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text("Mensaje Random"),
            ),
            const SizedBox(
              height: 20,
            ),
            const newsletter_card_widget(
              title: "Fiesta Halloween",
              message:
                  "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: GridView.builder(
                  // padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Número de columnas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    final item = menuList[index];
                    return menu_list_item_widget(item: item);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          authprovider.logout();
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
