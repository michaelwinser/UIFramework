class HorizontalStack extends UIElement {
  HorizontalStack() {
    this(0, 0, 0, 0);
  }

  HorizontalStack(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  void layout() {
    // evenly distribute children across the vertical space

    if (children.size() > 0) {
      int childWidth = w / children.size();

      int childX = 0;
      for (UIElement child : children) {
        child.x = childX; 
        child.y = 0;
        child.w = childWidth;
        child.h = h;

        childX += childWidth;
      }
    }
  }

  void draw() {
    background(255);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Horizontal Stack " + nf(children.size()) + " children", w / 2, height / 2);
  }
}
