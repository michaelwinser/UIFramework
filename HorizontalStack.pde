class HorizontalStack extends UIElement {
  HorizontalStack() {
    this(0, 0, 0, 0);
  }

  HorizontalStack(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  void layout() {
    // distribute children across the vertical space

    if (children.size() > 0) {
      // Get the size of the children that have an opinion
      int remainingWidth = w;
      int remainingChildren = children.size();

      for (UIElement child : children) {
        if (child.layoutWidth != 0) {
          remainingWidth -= child.layoutWidth;
          remainingChildren--;
        }
      }

      int defaultWidth = 0;
      if (remainingWidth > 0 && remainingChildren > 0) {
        defaultWidth = remainingWidth / remainingChildren;
      }

      int childX = 0;
      for (UIElement child : children) {
        int childWidth = child.layoutWidth != 0 ? child.layoutWidth : defaultWidth;

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
