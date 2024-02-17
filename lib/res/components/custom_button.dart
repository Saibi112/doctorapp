// ignore_for_file: use_key_in_widget_constructors

import '../../consts/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomButton({Key? key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const StadiumBorder(
            side: BorderSide(style: BorderStyle.solid, color: Colors.black),
          ),
        ),
        child: Container(
          // Wrap the text in a container for more customization
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black, // Text color
              fontWeight: FontWeight.bold, // Bold text
              fontSize: 16, // Adjust font size as needed
            ),
          ),
        ),
      ),
    );
  }
}
