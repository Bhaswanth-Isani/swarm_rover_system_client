import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swarm_rover_system_client/auth/auth.dart';
import 'package:swarm_rover_system_client/data.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(authControllerProvider.notifier).signOut(),
            icon: const Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 12, bottom: 24, left: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff202020),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    items[index].asset,
                    height: 100,
                  ),
                  Column(
                    children: [
                      Text(
                        items[index].name,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PRICE',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(items[index].price.toString()),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => null,
                        child: const Text('ORDER'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
