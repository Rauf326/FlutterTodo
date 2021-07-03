import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "0";
  List<dynamic> first = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Center(
          child: Text(
            "TodoApp",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1609693117459-886fbe8443ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=376&q=80"),
                fit: BoxFit.cover)),
        child: ListView.builder(
            itemCount: first.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 5),
                    child: Text(
                      "${first[index]}",
                      style: TextStyle(
                          color: Colors.cyan[700], fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Center(
                                        child: Text(
                                      "Edit Item",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    content: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Update Your Activity",
                                          hintStyle: TextStyle(fontSize: 12)),
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Center(
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.cyan[700]),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  first.replaceRange(index,
                                                      index + 1, {output});
                                                });
                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Icon(
                              Icons.edit,
                              color: Colors.cyan[700],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              first.removeAt(index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Icon(
                              Icons.delete,
                              color: Colors.cyan[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(
                      child: Text(
                    "Add Item",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  content: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Activity",
                        hintStyle: TextStyle(fontSize: 12)),
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.cyan[700]),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                first.add(output);
                              });
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
