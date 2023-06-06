// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controller.dart';
import 'input_field_container.dart';

final constantValues = Get.find<Constants>();

class InputFieldA extends StatefulWidget {
  var fontStyle;
  final TextEditingController controller;
  final double width;
  final double radius;
  final String title;
  final bool enabled;
  final Widget prefixIcon;
  final Widget suffixIcon;
  InputFieldA({
    Key? key,
    required this.fontStyle,
    required this.controller,
    required this.width,
    required this.radius,
    required this.title,
    required this.enabled,
    required this.prefixIcon,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  State<InputFieldA> createState() => _InputFieldAState();
}

class _InputFieldAState extends State<InputFieldA> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      radius: widget.radius,
      child: TextFormField(
        textInputAction: TextInputAction.send,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        autofillHints: const [AutofillHints.name],
        enabled: widget.enabled,
        validator: (value) => value == '' ? "required!" : null,
        style: GoogleFonts.poppins(textStyle: const TextStyle()),
        onTap: () {
          showSearch(
              context: context,
              delegate: CustomSearchDelegate(widget.fontStyle));
        },
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.title,
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(color: constantValues.greyColor)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.fontStyle);
  var fontStyle;
  List<List> searchResults = [
    ["Summer linen jacket", "#NEJ20089934122231", "Barcelona", "Paris"],
    ["Tapered-fit jeans AW", "#NEJ35870264978059", "Colombia", "Paris"],
    ["Macbook pro M2", "#NEJ43857340857904", "Paris", "Morocco"],
    ["Office setup desk", "#NEJ23481570754963", "France", "Germany"],
  ];

  @override
  String? get searchFieldLabel => "Enter the receipt number..";

  @override
  TextStyle? get searchFieldStyle =>
      GoogleFonts.poppins(textStyle: TextStyle(color: constantValues.greyColor));

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        CircleAvatar(
            backgroundColor: constantValues.orangeColor,
            radius: 14,
            child: Icon(
              Icons.print_outlined,
              color: constantValues.whiteColor,
            )),
        const SizedBox(
          width: 20,
        )
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query, style: fontStyle),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    var fontStyle = GoogleFonts.poppins(textStyle: const TextStyle());
    List<List> suggestions = searchResults.where((searchResult) {
      final result = searchResult[1].toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            leading: CircleAvatar(
                radius: 20,
                backgroundColor: constantValues.primaryColor,
                child: Icon(Icons.card_giftcard_rounded,
                    color: constantValues.whiteColor)),
            title: Text(suggestion[0], style: fontStyle),
            subtitle: Row(
              children: [
                Text(suggestion[1], style: fontStyle),
                const SizedBox(width: 5),
                Icon(Icons.circle, size: 2, color: constantValues.greyColor),
                const SizedBox(width: 5),
                Text(suggestion[2], style: fontStyle),
                const SizedBox(width: 5),
                Icon(Icons.arrow_forward_sharp,
                    size: 10, color: constantValues.greyColor),
                const SizedBox(width: 5),
                Text(suggestion[3], style: fontStyle),
              ],
            ),
            onTap: () {
              query = suggestion[1];

              showResults(context);
            },
          ),
        );
      },
    );
  }
}
