import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorty/models/item_model.dart';

class ItemPageWidget extends StatefulWidget {
  const ItemPageWidget({super.key, required this.item,});
  final ItemModel item;

  @override
  State<ItemPageWidget> createState() => _ItemPageWidgetState();
}

class _ItemPageWidgetState extends State<ItemPageWidget> {
  var s = true;

  var m = false;

  var l = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: Image.asset(
                          'assets/images/${widget.item.imageName}',
                          fit: BoxFit.cover,
                        )),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 50, left: 20, right: 20),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                        Icons.arrow_back_ios_outlined),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 20, right: 20),
                              height: 150,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 180,
                                        child: Text(
                                          widget.item.name,
                                          softWrap: true,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20,)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.black38,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Icon(Icons.coffee),
                                                  Text(
                                                    'Coffe',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.black38,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Icon(Icons.water_drop),
                                                  Text(
                                                    'Milk',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Container(
                                        height: 40,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(s
                                              ? "Small cup"
                                              : m
                                                  ? "Medium cup"
                                                  : "Large cup"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Описание',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 5),
                          Text(widget.item.description,
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 10),
                          Text('Размер',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 5),
                          Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              s = true;
              m = false;
              l = false;
              setState(() {});
            },
            child: Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                  color: s ? Colors.black38 : Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: s ? Colors.amber : Colors.black38)),
              child: Center(
                  child: Text('S',
                      style: Theme.of(context).textTheme.labelMedium)),
            ),
          ),
          InkWell(
            onTap: () {
              s = false;
              m = true;
              l = false;
              setState(() {});
            },
            child: Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                  color: m ? Colors.black38 : Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: m ? Colors.amber : Colors.black38)),
              child: Center(
                  child: Text('M',
                      style: Theme.of(context).textTheme.labelMedium)),
            ),
          ),
          InkWell(
            onTap: () {
              s = false;
              m = false;
              l = true;
              setState(() {});
            },
            child: Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                  color: l ? Colors.black38 : Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: l ? Colors.amber : Colors.black38)),
              child: Center(
                  child: Text('L',
                      style: Theme.of(context).textTheme.labelMedium)),
            ),
          )
        ],
      ),
    )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Цена",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '₽',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              s
                                  ? '${widget.item.cost}'
                                  : m
                                      ? '${widget.item.cost+60}'
                                      : '${widget.item.cost+100}',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Добавить в корзину',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}