import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final void Function()? onPressed;

  const AddButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          color: const Color(0xff3B6ABA).withOpacity(.8),
          child: const Center(
            child: Text(
              'Adicionar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
