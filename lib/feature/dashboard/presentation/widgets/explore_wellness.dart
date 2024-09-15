import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payuung_pribadi/feature/dashboard/data/models/wellness.dart';

class ExploreWellness extends StatefulWidget {
  const ExploreWellness({super.key});

  @override
  ExploreWellnessState createState() => ExploreWellnessState();
}

class ExploreWellnessState extends State<ExploreWellness> {
   List<Wellness> wellnessBox = [];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Wellness>>(
        valueListenable: Hive.box<Wellness>('wellnessBox').listenable(),
        builder: (context, box, _) {
          final items = box.values.toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore Wellness',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Terpopuler',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = items[index] as Wellness;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.network(item.imageUrl,width: MediaQuery.of(context).size.width/2,height: 80,)),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.price,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ) ;
  }
}
