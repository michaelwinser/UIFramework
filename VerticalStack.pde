class VerticalStack extends UIElement {
  VerticalStack() {
    this(0, 0, 0, 0);
  }

  VerticalStack(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  void layout() {
    // evenly distribute children across the vertical space

    println("Vertical.layout: " + nf(w) + " x " + nf(h));


    if (children.size() > 0) {
      int childHeight = h / children.size();

      int childY = 0;
      for (UIElement child : children) {
        child.x = 0; 
        child.y = childY;
        child.w = w;
        child.h = childHeight;

        childY += childHeight;
      }
    }
  }


  void draw() {
    background(255);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Vertical Stack " + nf(children.size()) + " children", w / 2, height / 2);
  }
}
