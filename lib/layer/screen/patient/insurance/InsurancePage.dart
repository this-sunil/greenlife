import 'package:flutter/material.dart';
import 'package:greenlife/data/entity/InsurancePlan.dart';
import 'package:greenlife/layer/widget/CustomText.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({super.key});

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {

  final List<InsurancePlan> plans = [
    InsurancePlan(
      title: "Health Protect Plus",
      company: "Star Health",
      coverage: "₹5,00,000",
      price: "₹6,500/year",
      color: Colors.blue,
    ),
    InsurancePlan(
      title: "Family Care Plan",
      company: "HDFC ERGO",
      coverage: "₹10,00,000",
      price: "₹12,000/year",
      color: Colors.green,
    ),
    InsurancePlan(
      title: "Senior Secure",
      company: "ICICI Lombard",
      coverage: "₹3,00,000",
      price: "₹4,200/year",
      color: Colors.orange,
    ),
    InsurancePlan(
      title: "Premium Shield",
      company: "Bajaj Allianz",
      coverage: "₹15,00,000",
      price: "₹18,500/year",
      color: Colors.purple,
    ),
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = plans
        .where((p) =>
    p.title.toLowerCase().contains(query.toLowerCase()) ||
        p.company.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(title:"Insurance Plans"),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search insurance plans...",
                filled: true,
                fillColor: Colors.white,

                contentPadding: .all(12),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final plan = filtered[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: plan.color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.health_and_safety,
                              color: plan.color,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plan.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  plan.company,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Checkbox(
                            value: plan.selected,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                plan.selected = value!;
                              });
                            },
                          )
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Coverage"),
                              Text(
                                plan.coverage,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Premium"),
                              Text(
                                plan.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: plan.color,
                            ),
                            onPressed: () {},
                            child: const Text("Buy"),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

     
    );
  }
}