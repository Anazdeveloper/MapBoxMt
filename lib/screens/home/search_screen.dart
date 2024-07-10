import 'package:ateam_flutter_mt/data/models/responses/suggestion_data.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_bloc.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_events.dart';
import 'package:ateam_flutter_mt/screens/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  final void Function(Suggestion) onSelected;
  const SearchScreen({super.key, required this.onSelected});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _homeBloc = HomeBloc();

  List<Suggestion> filteredList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _homeBloc,
        listener: (context, state) {
          if(state is SuggestionsLoaded) {
            setState(() {
              filteredList = state.suggestions;
              print("List: $filteredList");
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              SearchBar(
                  elevation: MaterialStateProperty.all(0),
                  constraints: const BoxConstraints(maxHeight: 50.0),
                  hintText: "Search Location",
                  autoFocus: true,
                  leading: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {

                    },
                  ),
                  onChanged: (query) {
                    subCategorySearch(query: query);
                  },
                  // backgroundColor:
                  // MaterialStateProperty.all(Colors.blueAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))
              ),
              const SizedBox(
                height: 10.0,
              ),
              _subCategoriesList(filteredList)
            ],
          ),
        ),
      ),
    );
  }

  subCategorySearch({required String query}) {
    _homeBloc.add(GetSearchSuggestion(query: query));
    // setState(() {
    //   filteredList = subCategories.where((element) => element.name.toUpperCase().contains(query.toUpperCase())).toList();
    // });
  }

  _subCategoriesList(List<Suggestion> suggestions) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              _subCategoryItem(suggestions[index]),
          separatorBuilder: (context, index) => const Divider(height: 10.0,),
          itemCount: suggestions.length),
    );
  }

  _subCategoryItem(Suggestion suggestion) {
    return ListTile(
      title: Text(suggestion.name, style: TextStyle(color: Colors.black),),
      onTap: () {
        widget.onSelected.call(suggestion);
        Navigator.of(context).pop();
      },
    );
  }
}
