void prologue(){
   prologueText1.display();
}

class Textbox{

  String tex;

  Textbox(String a_text){
    tex = a_text;
  }

  void display(){
    fill(255);
    rect(5, 500, 1280 - 10, 720 - 505);
    fill(0);
    text(tex, 10, 510);
  }

}
