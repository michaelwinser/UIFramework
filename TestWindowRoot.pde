class TestWindowRoot extends UIElement {
  HorizontalStack stack;
  Static floater;

  TestWindowRoot(int x, int y, int w, int h) {
    stack = new HorizontalStack(0, 0, width, height);
    floater = new Static(100, 100, 80, 50, "Floater");

    floater.setColour(color(255, 255, 0));
    this.addChild(stack);
    this.addChild(floater);


    UIElement leftPanel = new VerticalStack();
    Static centerPanel = new Static("Center"); 
    centerPanel.setColour(color(255, 0, 0));
    UIElement rightPanel = new VerticalStack();

    stack.addChild(leftPanel);
    stack.addChild(centerPanel);
    stack.addChild(rightPanel);

    helperAddStatics(leftPanel, "left static", 3);
    helperAddStatics(rightPanel, "right static", 5);
  }

  void layout() {
    stack.w = w;
    stack.h = h;

    floater.x = int(width / 2 + 50 * sin(radians(frameCount)));
    floater.y = int(height / 2 + 50 * cos(radians(frameCount)));
  }

  void helperAddStatics(UIElement e, String prefix, int count) {
    for (int i = 0; i < count; i++) {
      e.addChild(new Static(prefix + " " + nf(i)));
    }
  }
}
