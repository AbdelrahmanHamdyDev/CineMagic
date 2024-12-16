import 'package:cinemagic/Models/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemagic/Models/Motion.dart';
import 'package:cinemagic/WatcghLater_Provider.dart';
import 'package:cinemagic/Widgets/Reg_Slider.dart';

class watchLater extends ConsumerWidget {
  const watchLater({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Motion> Data = ref.watch(watchLaterProvider);
    List<Motion> laterTvshows =
        Data.where((motion) => motion.type == main_types.show).toList();
    List<Motion> laterMovies =
        Data.where((motion) => motion.type == main_types.movie).toList();

    return (laterMovies.isEmpty && laterTvshows.isEmpty)
        ? const Center(
            child: Text("Hmm...\nTry Adding SomeThing"),
          )
        : Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                if (laterTvshows.isNotEmpty)
                  regSlider(
                    items: laterTvshows,
                    title: "TvShows",
                    type: main_types.show,
                  ),
                const SizedBox(height: 10),
                if (laterMovies.isNotEmpty)
                  regSlider(
                    items: laterMovies,
                    title: "Movies",
                    type: main_types.movie,
                  ),
              ],
            ),
          );
  }
}
