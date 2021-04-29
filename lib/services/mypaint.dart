import 'dart:ui';

class MyPaint{

  static Color getMainColor(){
    return Color(0xFF2E1963);
  }

  static Color getSecondColor(){
    return Color(0xFF7362A1);
  }

  static Color getYellowColor(){
    return Color(0xFFFFC175);
  }

  static Color getLightGrey(){
    return Color(0xFFE8E8E8);
  }

  static Color getMainColorWithOpacity(){
    return Color(0xFF2E1963).withOpacity(0.5);
  }

  static Color getSecondColorWithOpacity(){
    return Color(0xFF7362A1).withOpacity(0.5);
  }

  static Color getGreyColor(){
    return Color(0xFFdcdcdc);
  }

  static Color getGreenColor(){
    return Color(0xFF0F7020);
  }

}