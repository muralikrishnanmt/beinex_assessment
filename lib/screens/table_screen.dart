// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:beinex_test/screens/chart_screen.dart';
import 'package:beinex_test/widgets/content_item.dart';
import 'package:beinex_test/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  DateTime selectedDate = DateTime.now();
  bool isLoading = true;

  String formatDate(String dateString) {
    DateTime originalDate = DateTime.parse(dateString);
    String formattedDate = DateFormat('d\'th\' MMM y').format(originalDate);
    return formattedDate;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List tableDataList = [];
  void fetchData() async {
    var response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/d49cdbcd-e611-4855-912c-9fbaa09df7b2'));
    var res = json.decode(response.body);
    setState(() {
      tableDataList = res;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWidget(),
                    SingleChildScrollView(
                      child: Column(
                        children: List<Widget>.generate(
                          //apiResponse.length,
                          10,
                          (index) {
                            final isActive = tableDataList[index]['active'];
                            final backgroundColor =
                                isActive ? Colors.grey[300] : Colors.grey;
                            final currentCount =
                                tableDataList[index]['status']['current_count'];
                            final totalCount =
                                tableDataList[index]['status']['total_count'];
                            final progress = currentCount / totalCount;
                            var itemTypeValue1;
                            var chipColorItem1;
                            if (tableDataList[index]['item_type1']['value'] !=
                                null) {
                              itemTypeValue1 =
                                  tableDataList[index]['item_type1']['value'];
                              final colorHexIT1 =
                                  tableDataList[index]['item_type1']['color'];
                              chipColorItem1 = Color(int.parse(
                                  colorHexIT1.replaceAll('#', '0xFF')));
                            }
                            var itemTypeValue2;
                            var chipColorItem2;
                            if (tableDataList[index]['item_type2']['value'] !=
                                null) {
                              itemTypeValue2 =
                                  tableDataList[index]['item_type2']['value'];
                              final colorHexIT2 =
                                  tableDataList[index]['item_type2']['color'];
                              chipColorItem2 = Color(int.parse(
                                  colorHexIT2.replaceAll('#', '0xFF')));
                            }
                            final List level1List =
                                tableDataList[index]['level1'] ?? [];
                            final List level2List =
                                tableDataList[index]['level2'] ?? [];

                            return GestureDetector(
                              onTap: () {
                                if (isActive) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChartScreen(
                                        id: tableDataList[index]['item_id']
                                            .toString(),
                                        title: tableDataList[index]['title'],
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      ContentItem(
                                        label: tableDataList[index]['id']
                                            .toString(),
                                        width: 100,
                                        backgroundColor: backgroundColor!,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      ContentItem(
                                        label: tableDataList[index]['item_id']
                                            .toString(),
                                        width: 100,
                                        backgroundColor: backgroundColor,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 200,
                                        color: backgroundColor,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              tableDataList[index]['title'],
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                //color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (tableDataList[index]['overdue'] ==
                                              false) {
                                            selectDate(context);
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 140,
                                          color: backgroundColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.date_range,
                                                color: tableDataList[index]
                                                            ['overdue'] ==
                                                        true
                                                    ? Colors.red
                                                    : Colors.green,
                                              ),
                                              Text(
                                                formatDate(
                                                  tableDataList[index]['date'],
                                                ),
                                                style: const TextStyle(
                                                  //color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        color: backgroundColor,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 20,
                                              child: LinearProgressIndicator(
                                                value:
                                                    progress, // Set the progress value
                                                backgroundColor:
                                                    backgroundColor, // Background color
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                            Color>(
                                                        Colors
                                                            .brown), // Progress color
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        color: backgroundColor,
                                        child: Center(
                                          child: Chip(
                                            label: Text(
                                              tableDataList[index]['item_type1']
                                                          ['value'] !=
                                                      null
                                                  ? itemTypeValue1
                                                  : "",
                                            ),
                                            backgroundColor:
                                                tableDataList[index]
                                                                ['item_type1']
                                                            ['value'] !=
                                                        null
                                                    ? chipColorItem1
                                                    : Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 150,
                                        color: backgroundColor,
                                        child: Center(
                                          child: tableDataList[index]
                                                      ['item_type2']['value'] !=
                                                  null
                                              ? Chip(
                                                  label: Text(
                                                    tableDataList[index][
                                                                    'item_type2']
                                                                ['value'] !=
                                                            null
                                                        ? itemTypeValue2
                                                        : "",
                                                  ),
                                                  backgroundColor: tableDataList[
                                                                      index]
                                                                  ['item_type2']
                                                              ['value'] !=
                                                          null
                                                      ? chipColorItem2
                                                      : Colors.grey,
                                                )
                                              : const SizedBox(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 200,
                                        color: backgroundColor,
                                        child: Wrap(
                                          children: List.generate(
                                              level1List.length, (index2) {
                                            return Chip(
                                              label: Text(
                                                level1List[index2]['value'],
                                              ),
                                              backgroundColor: Colors.grey[400],
                                            );
                                          }),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 200,
                                        color: backgroundColor,
                                        child: Center(
                                          child: Wrap(
                                            children: List.generate(
                                                level2List.length, (index2) {
                                              return Chip(
                                                label: Text(
                                                  level2List[index2]['value'],
                                                ),
                                                backgroundColor:
                                                    Colors.grey[400],
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
