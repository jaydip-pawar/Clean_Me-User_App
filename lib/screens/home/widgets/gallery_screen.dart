import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late OverlayEntry _popupDialog;
  List<String> imageUrls = [
    'https://media.istockphoto.com/photos/shot-of-an-unrecognisable-teenager-picking-up-litter-off-a-field-at-picture-id1326024656?b=1&k=20&m=1326024656&s=170667a&w=0&h=6ZeoEq_OYHd2aGCOwAHMFQwUvAgcrSOVERojh_1QKvs=',
    'https://images.unsplash.com/photo-1605600659908-0ef719419d41?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2FyYmFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1619540034640-0d41b5e0f6fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2FyYmFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1510251197878-a2e6d2cb590c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGdhcmJhZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1592890278983-18616401d4ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGdhcmJhZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1611830696076-462acd8aa9e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGdhcmJhZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1611830696076-462acd8aa9e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGdhcmJhZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/photos/heap-of-scrap-iron-picture-id490057994?b=1&k=20&m=490057994&s=170667a&w=0&h=_7XQ28VrZs6Yey0WYu3W5DCgHwI_XlEpzXjCy5IRm4I=',
    'https://media.istockphoto.com/photos/heap-of-scrap-iron-picture-id490057994?b=1&k=20&m=490057994&s=170667a&w=0&h=_7XQ28VrZs6Yey0WYu3W5DCgHwI_XlEpzXjCy5IRm4I=',
    'https://images.unsplash.com/photo-1592890278983-18616401d4ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGdhcmJhZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/photos/hauling-garbage-picture-id1286996660?b=1&k=20&m=1286996660&s=170667a&w=0&h=1iZCui1UftPy9Mbm68QnKDpA6nf_RoFFn70PAfJamRQ=',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        children: imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
    builder: (context) => GestureDetector(
      onLongPress: () {
        _popupDialog = _createPopupDialog(url);
        Overlay.of(context)?.insert(_popupDialog);
      },
      onLongPressEnd: (details) => _popupDialog.remove(),
      child: Image.network(url, fit: BoxFit.cover),
    ),
  );

  OverlayEntry _createPopupDialog(String url) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(url),
      ),
    );
  }

  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://placeimg.com/640/480/people'),
        ),
        title: Text(
          'john.doe',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));

  Widget _createActionBar() => Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.favorite_border,
          color: Colors.black,
        ),
        Icon(
          Icons.chat_bubble_outline_outlined,
          color: Colors.black,
        ),
        Icon(
          Icons.send,
          color: Colors.black,
        ),
      ],
    ),
  );

  Widget _createPopupContent(String url) => Container(
    padding: EdgeInsets.symmetric(horizontal: 14.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _createPhotoTitle(),
          Image.network(url, fit: BoxFit.fitWidth),
          _createActionBar(),
        ],
      ),
    ),
  );
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}