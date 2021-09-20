import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroceryStore extends StatefulWidget {
  const GroceryStore({Key? key}) : super(key: key);

  @override
  _GroceryStoreState createState() => _GroceryStoreState();
}

class _GroceryStoreState extends State<GroceryStore> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('test');

  @override
  initState() {
    super.initState();
    collectionReference.snapshots().listen((snapshot) {
      setState(() {});
    });
  }

  addData() {
    Map<String, dynamic> demoData = {
      'name': 'Ivan Petrov',
      'email': 'ivan.petrov@gmail.com',
      'age': 30
    };

    collectionReference.add(demoData);
  }

  deleteData() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var doc in querySnapshot.docs) {
      doc.reference.delete();
    }
  }

  updateData() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var doc in querySnapshot.docs) {
      doc.reference.update({'name': 'updated', 'email': 'updated', 'age': 1});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase test'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                addData();
              },
              child: const Text('add data'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: const Text('Clear collection'),
            ),
            ElevatedButton(
              onPressed: () {
                updateData();
              },
              child: const Text('update all entries'),
            ),
            FutureBuilder(
                future: collectionReference.get(),
                builder: (ctx, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    List<dynamic> data = (snapshot.data as dynamic)
                        .docs
                        .map((doc) => doc.data())
                        .toList() as List<dynamic>;
                    return Text(data.toString());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
