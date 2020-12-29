class Static extends UIElement {

  String text;
  PImage image;
  color c = color(255);
  
  int size = 20;

  Static(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  Static(int x, int y, int w, int h, PImage image) {
    super(x, y, w, h);
    this.image = image;
  }

  Static(int x, int y, int w, int h, String text) {
    super(x, y, w, h);
    this.text = text;
  }

  Static(String text) {
    super();
    this.text = text;
  }
  
  Static(PImage image) {
    super();
    this.image = image;
  }
  
  Static(color c) {
    super();
    this.c = c;
  }
  
  void setColour(color c) {
    this.c = c;
  }
  
  void draw() {

    fill(c);
    
    rectMode(CORNER);
    rect(0, 0, w, h);
    
    if (this.image != null) {
      imageMode(CORNER);
      //image(this.image, 0, 0, w, h);
      image(this.image, 0, 0);
    }

    if (this.text != null) {
      textAlign(CENTER, CENTER);

      fill(0);
      textSize(size);
      text(this.text, w / 2, h / 2);
      
    }
  }
}
