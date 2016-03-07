console.log('Coffee compiles.');

window.rect = void 0;

window.innerRect = void 0;

window.resizeDimensions = function(elem, width, height) {
  var prevPos, scaleX, scaleY;
  scaleX = width / elem.bounds.width;
  scaleY = height / elem.bounds.height;
  prevPos = new paper.Point(elem.bounds.x, elem.bounds.y);
  return elem.scale(scaleX, scaleY);
};

window.onload = function() {
  var rectSize;
  paper.setup('container');
  rectSize = 500;
  window.rect = new paper.Path.Rectangle({
    center: [360, 360],
    size: [720, 720],
    fillColor: 'red'
  });
  paper.view.onMouseMove = function(e) {
    if (window.innerRect) {
      resizeDimensions(window.innerRect, e.point.x, e.point.x);
      window.innerRect.fillColor = {
        hue: 360 - e.point.y / 2,
        saturation: 1,
        brightness: 1
      };
    } else {
      window.innerRect = new paper.Path.Rectangle({
        center: [360, 360],
        size: [e.point.x, e.point.x],
        fillColor: {
          hue: 360 - e.point.y,
          saturation: 1,
          brightness: 1
        }
      });
    }
    if (window.rect) {
      return window.rect.fillColor = {
        hue: e.point.y / 2,
        saturation: 1,
        brightness: 1
      };
    }
  };
  return paper.view.draw();
};
