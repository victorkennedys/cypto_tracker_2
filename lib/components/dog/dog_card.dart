import 'package:flutter/material.dart';
import 'package:woof/components/dog/dog_avatar.dart';
import 'package:woof/components/input%20widgets/checkbox.dart';
import 'package:woof/screens/dog/current_dog.dart';

class DogCard extends StatefulWidget {
  final String docId;
  final String name;
  final String breed;

  final String imageUrl;
  final bool selectable;
  final List<String>? dogList;
  final String age;
  final Function? nameCallBack;

  const DogCard(
      {Key? key,
      required this.docId,
      required this.name,
      required this.breed,
      required this.imageUrl,
      required this.selectable,
      this.dogList,
      required this.age,
      this.nameCallBack})
      : super(key: key);

  @override
  State<DogCard> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  callBack(bool selected) {
    setState(() {
      selected
          ? {
              widget.dogList!.add(widget.docId),
              widget.nameCallBack!(widget.name, true)
            }
          : {
              widget.dogList!.remove(widget.docId),
              widget.nameCallBack!(widget.name, false)
            };
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectable == false
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CurrentDog(
                          name: widget.name,
                          breed: widget.breed,
                          image1: widget.imageUrl,
                          age: widget.age,
                        )),
              )
            : () {
                //if selectable nothing happens onPressed
              };
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DogAvatar(widget.imageUrl),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.name),
                    Text(widget.breed),
                  ],
                ),
              ],
            ),
            widget.selectable ? FormCheckBox(callBack) : Container(),
          ],
        ),
      ),
    );
  }
}
