class VerticalStack extends UIElement {
  VerticalStack() {
    this(0, 0, 0, 0);
  }

  VerticalStack(int x, int y, int w, int h) {
    super(x, y, w, h);
  }
  void layout() {
    // distribute children across the vertical space

    if (children.size() > 0) {
      // Get the size of the children that have an opinion
      int remainingHeight = h;
      int remainingChildren = children.size();

      for (UIElement child : children) {
        if (child.layoutHeight != 0) {
          remainingHeight -= child.layoutHeight;
          remainingChildren--;
        }
      }

      int defaultHeight = 0;
      if (remainingHeight > 0 && remainingChildren > 0) {
        defaultHeight = remainingHeight / remainingChildren;
      }

      int childY = 0;
      for (UIElement child : children) {
        int childHeight = child.layoutHeight != 0 ? child.layoutHeight : defaultHeight;

        child.y = childY; 
        child.x = 0;
        child.w = w;
        child.h = childHeight;

        childY += childHeight;
      }
    }
  }

  void oldlayout() {
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
