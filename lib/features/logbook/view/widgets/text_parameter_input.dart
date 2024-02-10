import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class TextParameterInput extends StatefulWidget {
  const TextParameterInput({
    required this.title,
    this.hints = const [],
    this.onSelect,
    this.initValue,
    super.key,
  });

  final String title;
  final List<String> hints;
  final String? initValue;
  final Function(String result)? onSelect;

  @override
  State<TextParameterInput> createState() => _TextParameterInputState();
}

class _TextParameterInputState extends State<TextParameterInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      EasyDebounce.debounce(
        'testParameter#${widget.title}',
        const Duration(seconds: 1),
            () {
          if (widget.onSelect != null) {
            widget.onSelect!(_controller.text);
          }
        },
      );
    });
  }

  @override
  void didUpdateWidget(TextParameterInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initValue != null && widget.initValue != oldWidget.initValue) {
      _controller.text = widget.initValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
          Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              child: TextField(
                controller: _controller,
              ),
            ),
            IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: const Icon(Icons.close)),
          ]),
          Flexible(
            child: Wrap(
              children: widget.hints
                  .map(
                    (hint) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                      onPressed: () {
                        _controller.text = hint;
                      },
                      child: Text(hint)),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
