import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginform/api/model/user_detail_model.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  late Future<UserDetail> futureDetail;
  @override
  void initState() {
    super.initState();
    futureDetail = fetchUserdetail();
  }

  Future<UserDetail> fetchUserdetail() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/users"));
    if (response.statusCode == 200) {
      return UserDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<UserDetail>(
          future: futureDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(snapshot.data?.users?[0].firstName ?? ''),
                  Text(snapshot.data?.users?[0].lastName ?? ''),
                  Text(snapshot.data?.users?[0].maidenName ?? ''),
                  Text(snapshot.data?.users?[0].gender ?? ''),
                  Text(snapshot.data?.users?[0].email ?? ''),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
