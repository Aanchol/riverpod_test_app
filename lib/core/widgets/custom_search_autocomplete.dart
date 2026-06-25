import 'package:flutter/material.dart';

class CustomSearchAutocomplete<T extends Object> extends StatelessWidget {
  const CustomSearchAutocomplete({
    super.key,
    required this.options,
    required this.displayStringForOption,
    required this.onSelected,
    this.hintText,
    this.labelText,
    this.controller,
  });

  final List<T> options;
  final String Function(T option) displayStringForOption;
  final ValueChanged<T> onSelected;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      displayStringForOption: displayStringForOption,

      optionsBuilder: (TextEditingValue value) {
        if (value.text.isEmpty) {
          return Iterable<T>.empty();
        }

        return options.where((option) {
          return displayStringForOption(
            option,
          ).toLowerCase().contains(value.text.toLowerCase());
        });
      },

      onSelected: onSelected,

      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
            if (controller != null &&
                controller!.text != textEditingController.text) {
              textEditingController.text = controller!.text;
            }

            return TextFormField(
              controller: controller ?? textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: hintText,
                labelText: labelText,
                // border: const OutlineInputBorder(),
              ),
            );
          },

      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 8,
            child: SizedBox(
              width: 300,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);

                  return ListTile(
                    title: Text(displayStringForOption(option)),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
