import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aniplay/themes/themes.dart';
import 'package:aniplay/controllers/runtime_data_controller.dart';
import 'package:aniplay/views/widgets/catalog/catalog_options.dart';
import 'package:aniplay/views/widgets/catalog/catalog_grid_item.dart';
import 'package:aniplay/views/widgets/catalog/catalog_items_loading.dart';
import 'package:aniplay/views/widgets/catalog/catalog_logo_search_bar.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: RuntimeController.themeMode(),
      home: Scaffold(
        backgroundColor: RuntimeController.isDarkMode
            ? Themes.dark.scaffoldBackgroundColor
            : Themes.light.scaffoldBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Obx(
                () {
                  return RuntimeController.itemLoaded.value
                      ? const GridCatalog()
                      : const LoadingItems();
                },
              ),
              const IntrinsicHeight(
                child: Column(
                  children: [LogoAndSearchBar(), Options()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
