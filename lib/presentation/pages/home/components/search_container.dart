import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 246, 243, 1),
                borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(249, 246, 243, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.my_location_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 80,
                    minHeight: 40,
                  ),
                  hintText: "Search City"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800),
              onPressed: () {},
              child: Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
