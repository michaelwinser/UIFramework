class BorderLayout extends UIElement {

  BorderLayout(int x, int y, int w, int h) {
    super(x, y, w, h);
  }

  void layout() {
    // Five regions. Only one child per region. First match.
    UIElement north = null, south = null, east = null, west = null, center = null;

    for (UIElement child : children) {
      switch (child.borderPosition) {
      case North:
        if (north == null) {
          north = child;
        }
        break;
      case South:
        if (south == null) {
          south = child;
        }
        break;
      case East:
        if (east == null) {
          east = child;
        }
        break;
      case West: 
        if (west == null) {
          west = child;
        }
        break;
      case Center:
        if (center == null) {
          center = child;
        }
      }
    }

    // For now we assume that border elements have an appropriate layoutWidth or layoutHeight

    int verticalOffset = 0; //<>//
    int horizontalOffset = 0;
    int verticalSpace = h;
    int horizontalSpace = w;
    if (north != null) {
      north.x = 0; 
      north.y = 0;
      north.w = w;
      north.h = north.layoutHeight;

      verticalSpace = north.h;
      verticalOffset = north.h;
    }

    if (south != null) {
      south.x = 0;
      south.y = h - south.layoutHeight;
      south.w = w;
      south.h = south.layoutHeight;

      verticalSpace -= south.h;
    }

    if (east != null) {
      east.x = w - east.layoutWidth;
      east.y = verticalOffset;
      east.w = east.layoutWidth;
      east.h = verticalSpace;

      horizontalSpace -= east.w;
    }
    
    if (west != null) {
      west.x = 0;
      west.y = verticalOffset;
      west.w = west.layoutWidth;
      west.h = verticalSpace;

      horizontalOffset = west.w;
      horizontalSpace -= west.w;
    }

    if (center != null) {
      center.x = horizontalOffset;
      center.y = verticalOffset;
      center.w = horizontalSpace;
      center.h = verticalSpace;
    }
  }
}
