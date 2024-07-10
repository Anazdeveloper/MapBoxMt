import 'package:ateam_flutter_mt/screens/history/bloc/history_bloc.dart';
import 'package:ateam_flutter_mt/screens/history/bloc/history_events.dart';
import 'package:ateam_flutter_mt/screens/history/bloc/history_states.dart';
import 'package:ateam_flutter_mt/screens/history/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _historyBloc = HistoryBloc();

  @override
  void initState() {
    _historyBloc.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                        color: Colors.blueAccent,
                      ),
                      child: const ListTile(
                        leading: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                        title: Text('John Doe', style: TextStyle(color: Colors.white),),
                        subtitle: Text('robertdoe@gmail.com', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    BlocConsumer(
                        bloc: _historyBloc,
                        listener: (context, state) {
                          if(state is InitialLoading) {
                            loadingDialog();
                          }
                        },
                        builder: (context, state) {
                          if(state is DataFetched) {
                            Navigator.of(context).pop();
                            return Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.3,
                                        child: HistoryWidget(data: state.datas[index], index: index)
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 20.0);
                                  },
                                  itemCount: state.datas.length
                              ),
                            );
                          }

                          return const Center(
                              child: Text(
                                "No Data"
                              )
                          );
                        },
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          color: Colors.blueAccent,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Go Back',
                                    style: TextStyle(
                                        color: Colors.blueAccent
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  loadingDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        // dialogContext = context;
        return const Dialog(
          child: SizedBox(
            height: 100.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
