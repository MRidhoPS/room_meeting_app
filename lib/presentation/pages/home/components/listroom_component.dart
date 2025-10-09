import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/controller/app_controller.dart';
import 'package:room_meeting_app/data/models/room_model.dart';
import 'package:room_meeting_app/presentation/pages/home/viewmodels/home_controller.dart';

class ListRooms extends StatelessWidget {
  const ListRooms({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
              child: Text(
            "Error: ${controller.errorMessage.value}",
            style: TextStyle(color: Colors.black),
          ));
        }

        final rooms = controller.getListRoomsData.value?.data;

        if (rooms == null || rooms.isEmpty) {
          return const Center(child: Text("No rooms available"));
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final room = rooms[index];
            return RoomCard(
              key: ValueKey(room.id),
              room: room,
            );
          },
        );
      },
    );
  }
}

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final RoomData room;

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: height * 0.38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            height: height * 0.26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: room.thumbnail,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      room.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      formatRupiah(room.price),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  room.city,
                  style: const TextStyle(
                    color: Colors.black26,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
