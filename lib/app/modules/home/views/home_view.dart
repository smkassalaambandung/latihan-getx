import 'package:flutter/material.dart';
import 'package:flutter_application/model/kategori_response.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<KategoryResponse>(
        future: controller.getKategori(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                'Nuju Ngecek Data',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Teu Aya Data'),
            );
          }
          var kategori = snapshot.data!.data;
          return ListView.builder(
            itemCount: kategori.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(kategori[index].firstName),
                  Text(kategori[index].lastName),
                  Text(kategori[index].email),
                  CircleAvatar(
                    backgroundImage: NetworkImage(kategori[index].avatar),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
