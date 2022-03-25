import 'package:flutter/material.dart';

class SliverAnimatedListSample extends StatefulWidget {
  const SliverAnimatedListSample({Key? key}) : super(key: key);

  @override
  State<SliverAnimatedListSample> createState() =>
      _SliverAnimatedListSampleState();
}

class _SliverAnimatedListSampleState extends State<SliverAnimatedListSample>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  List<int> _fetchedItems = [0, 1, 2, 3];
  List<int> _items = [];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    for (int item in _fetchedItems) {
      // 1) Wait for one second
      await Future.delayed(Duration(milliseconds: 500));
      // 2) Adding data to actual variable that holds the item.
      _items.add(item);
      // 3) Telling animated list to start animation
      _listKey.currentState?.insertItem(_items.length - 1);
    }
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.decelerate,
          reverseCurve: Curves.decelerate)),
      child: Title(
          color: Colors.black,
          child: Center(
            child: SizedBox(height: 103, child: Text(' $_items[index]')),
          )),
    );
  }

  // Used to build an item after it has been removed from the list. This
  // method is needed because a removed item remains visible until its
  // animation has completed (even though it's gone as far this ListModel is
  // concerned). The widget will be used by the
  // [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (BuildContext context, int index, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset(0, 0),
                  ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.decelerate,
                      reverseCurve: Curves.decelerate)),
                  child: Title(
                      color: Colors.black,
                      child: Center(
                        child: SizedBox(
                            height: 103, child: Text(' $_items[index]')),
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

typedef RemovedItemBuilder = Widget Function(
    int item, BuildContext context, Animation<double> animation);

// Keeps a Dart [List] in sync with an [AnimatedList].
//
// The [insert] and [removeAt] methods apply to both the internal list and
// the animated list that belongs to [listKey].
//
// This class only exposes as much of the Dart List API as is needed by the
// sample app. More list methods are easily added, however methods that
// mutate the list must make the same changes to the animated list in terms
// of [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<SliverAnimatedListState> listKey;
  final RemovedItemBuilder removedItemBuilder;
  final List<E> _items;

  SliverAnimatedListState get _animatedList => listKey.currentState!;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
        index,
        (BuildContext context, Animation<double> animation) =>
            removedItemBuilder(index, context, animation),
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

// Displays its integer item as 'Item N' on a Card whose color is based on
// the item's value.
//
// The card turns gray when [selected] is true. This widget's height
// is based on the [animation] parameter. It varies as the animation value
// transitions from 0.0 to 1.0.
class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  })  : assert(item >= 0),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 2.0,
        bottom: 0.0,
      ),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: selected
                  ? Colors.black12
                  : Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text(
                  'Item $item',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
