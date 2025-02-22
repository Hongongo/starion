import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
  MenuItem('Giróscopio', Icons.downloading, '/gyroscope'),
  MenuItem('Acelerómetro', Icons.speed, '/accelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/magnetometer'),
  MenuItem(
      'Giróscopio Ball', Icons.sports_baseball_outlined, '/gyroscope-ball'),
  MenuItem('Brújula', Icons.explore, '/compass'),
  MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  MenuItem('Background Process', Icons.storage_rounded, '/db-pokemons'),

  MenuItem('Biometrics', Icons.fingerprint, '/biometrics'),

  // Maps and location
  MenuItem('Location', Icons.pin_drop, '/location'),
  MenuItem('Maps', Icons.map_outlined, '/maps'),
  MenuItem('Control', Icons.gamepad_outlined, '/controlled-map'),

  // Badge
  MenuItem('Badge', Icons.notification_important, '/badge'),

  // Ads
  MenuItem('Ad Full', Icons.ad_units_outlined, '/ad-fullscreen'),
  MenuItem('Ad Reward', Icons.fort_rounded, '/ad-rewarded'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map(
            (item) => HomeMenuItem(
              title: item.title,
              route: item.route,
              icon: item.icon,
            ),
          )
          .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const HomeMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    this.bgColors = const [Colors.pink, Colors.red],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: bgColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
