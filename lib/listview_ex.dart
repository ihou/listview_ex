import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class ListViewEx extends StatelessWidget {
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final List<Widget>? children;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final double? itemExtent;
  final Widget? prototypeItem;
  final int? itemCount;
  final IndexedWidgetBuilder? itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final SliverChildDelegate? childrenDelegate;
  final Widget? header;
  final Widget? footer;

  const ListViewEx(
      {Key? key,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.controller,
      this.primary,
      this.physics,
      this.shrinkWrap = false,
      this.padding,
      this.addAutomaticKeepAlives = true,
      this.addRepaintBoundaries = true,
      this.addSemanticIndexes = true,
      this.cacheExtent,
      this.children,
      this.semanticChildCount,
      this.dragStartBehavior = DragStartBehavior.start,
      this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
      this.restorationId,
      this.clipBehavior = Clip.hardEdge,
      this.itemExtent,
      this.prototypeItem,
      this.itemCount,
      this.itemBuilder,
      this.separatorBuilder,
      this.header,
      this.footer,
      this.childrenDelegate})
      : assert(childrenDelegate == null),
        assert(separatorBuilder == null),
        super(key: key);

  const ListViewEx.builder({
    Key? key,
    this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.itemExtent,
    this.prototypeItem,
    this.children,
    this.header,
    this.footer,
    this.childrenDelegate,
  })  : assert(childrenDelegate == null),
        assert(separatorBuilder == null),
        super(key: key);

  const ListViewEx.custom({
    Key? key,
    this.itemCount,
    this.itemBuilder,
    this.separatorBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.itemExtent,
    this.prototypeItem,
    this.children,
    this.header,
    this.footer,
    required this.childrenDelegate,
  })  : assert(separatorBuilder == null),
        super(key: key);

  const ListViewEx.separated({
    Key? key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.itemExtent,
    this.prototypeItem,
    this.children,
    this.header,
    this.footer,
    this.childrenDelegate,
  })  : assert(childrenDelegate == null),
        super(key: key);

  Widget buildItem(context, index) {
    var exCount = 0;
    if (header != null) {
      exCount++;
    }
    if (footer != null) {
      exCount++;
    }
    if (header != null && index == 0) {
      return header!;
    }

    if (footer != null && index == itemCount! + exCount - 1) {
      return footer!;
    }

    return itemBuilder!.call(context, header == null ? index : index - 1);
    /*if (header != null && footer == null) {
              if (index == 0) {
                return header!;
              }
              return itemBuilder!.call(context, index - 1);
            } else if (header != null && footer != null) {
              if (index == 0) {
                return header!;
              }
              if (index == itemCount! + exCount - 1) {
                return footer!;
              }
              return itemBuilder!.call(context, index - 1);
            } else if (header == null && footer != null) {
              if (index == itemCount! + exCount - 1) {
                return footer!;
              }
              return itemBuilder!.call(context, index);
            }
            return itemBuilder!.call(context, index);*/
  }

  @override
  Widget build(BuildContext context) {
    if (separatorBuilder != null) {
      if (footer != null && itemCount == null) {
        throw "if footer!=null ,itemCount can not be null";
      }
      int exCount = 0;
      if (header != null) {
        exCount++;
      }
      if (footer != null) {
        exCount++;
      }
      return ListView.separated(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        separatorBuilder: separatorBuilder!,
        itemCount: itemCount! + exCount,
        itemBuilder: buildItem,
      );
    }

    if (childrenDelegate != null) {
      return ListView.custom(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        itemExtent: itemExtent,
        prototypeItem: prototypeItem,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        childrenDelegate: SliverChildDelegateProxy(childrenDelegate!,
            header: header, footer: footer),
      );
    }
    if (itemBuilder != null) {
      if (footer != null && itemCount == null) {
        throw "if footer!=null ,itemCount can not be null";
      }

      var exCount = 0;
      if (header != null) {
        exCount++;
      }
      if (footer != null) {
        exCount++;
      }

      return ListView.builder(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
          itemCount: itemCount == null ? itemCount : itemCount! + exCount,
          itemBuilder: buildItem);
    }

    List<Widget> children2 = (children?.map((e) => e).toList() ??
        <Widget>[]); //so weird,I have to do this cast,or insert will throw exception
    if (header != null) {
      children2.insert(0, header!);
    }
    if (footer != null) {
      children2.add(footer!);
    }
    return ListView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      children: children2,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
  }
}

class SliverChildDelegateProxy extends SliverChildDelegate {
  final SliverChildDelegate delegate;
  final Widget? header;
  final Widget? footer;
  var exCount = 0;

  SliverChildDelegateProxy(
    this.delegate, {
    this.header,
    this.footer,
  }) {
    if (header != null) {
      exCount++;
    }
    if (footer != null) {
      exCount++;
    }
  }

  @override
  Widget? build(BuildContext context, int index) {
    if (header != null && index == 0) {
      return header!;
    }
    int? itemCount;
    if (delegate is SliverChildBuilderDelegate) {
      itemCount = (delegate as SliverChildBuilderDelegate).childCount;
      if (footer != null && itemCount == null) {
        throw "if footer!=null ,childCount can not be null";
      }
    } else if (delegate is SliverChildListDelegate) {
      itemCount = (delegate as SliverChildListDelegate).children.length;
    } else {
      throw "not supported SliverChildDelegate subclass";
    }

    if (footer != null && index == itemCount! + exCount - 1) {
      return footer!;
    }
    return delegate.build(context, header == null ? index : index - 1);
  }

  @override
  bool shouldRebuild(covariant SliverChildDelegate oldDelegate) {
    if (delegate is SliverChildBuilderDelegate) {
      return true;
    } else if (delegate is SliverChildListDelegate) {
      return (delegate as SliverChildListDelegate).children !=
          ((oldDelegate as SliverChildDelegateProxy).delegate
                  as SliverChildListDelegate)
              .children;
    }
    throw "not supported SliverChildDelegate subclass";
  }

  @override
  int? get estimatedChildCount => delegate.estimatedChildCount;

  @override
  double? estimateMaxScrollOffset(
    int firstIndex,
    int lastIndex,
    double leadingScrollOffset,
    double trailingScrollOffset,
  ) =>
      delegate.estimateMaxScrollOffset(
        firstIndex,
        lastIndex,
        leadingScrollOffset,
        trailingScrollOffset,
      );

  @override
  void didFinishLayout(int firstIndex, int lastIndex) =>
      delegate.didFinishLayout(firstIndex, lastIndex);

  @override
  int? findIndexByKey(Key key) => delegate.findIndexByKey(key);
}
