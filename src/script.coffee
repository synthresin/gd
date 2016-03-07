console.log 'Coffee compiles.'
window.rect = undefined;
window.innerRect = undefined;
# Only run our code once the DOM is ready.

window.resizeDimensions = (elem,width,height) ->
    scaleX = width/elem.bounds.width;
    scaleY = height/elem.bounds.height;
    prevPos = new paper.Point(elem.bounds.x,elem.bounds.y);

    elem.scale(scaleX,scaleY);

    # newPos = prevPos + new paper.Point(elem.bounds.width/2,elem.bounds.height/2);
    # elem.position = newPos;


window.onload = ->
  # Set up paper.js
  paper.setup 'container'

  rectSize = 500

  window.rect = new paper.Path.Rectangle({
      center: [360, 360],
      size: [720, 720],
      fillColor: 'red'
  });

  paper.view.onMouseMove = (e) ->
    if window.innerRect
      resizeDimensions(window.innerRect, e.point.x, e.point.x)
      window.innerRect.fillColor = { hue: 360 - e.point.y/2, saturation: 1, brightness: 1 }
    else
      window.innerRect = new paper.Path.Rectangle({
        center: [360, 360],
        size: [e.point.x, e.point.x],
        fillColor: { hue: 360 - e.point.y, saturation: 1, brightness: 1 }
      });

    if window.rect
      window.rect.fillColor = { hue: e.point.y/2, saturation: 1, brightness: 1 }

  # paper.view.onMouseMove
    # change rect size
  paper.view.draw()

  # change position origin
