import 'package:flutter/material.dart';

class log_reg extends StatefulWidget {
  const log_reg({super.key});

  @override
  State<log_reg> createState() => _log_regState();
}

class _log_regState extends State<log_reg> {
  @override
  Widget build(BuildContext context) {
    var menu;
    return Container(
        child: Scrollbar(
      thickness: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: menu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0.2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            menu[index].icon,
                            size: 30,
                          ),
                          SizedBox(height: 20),
                          Text(
                            menu[index].title,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 10, color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
