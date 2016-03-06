console.log('Coffee compiles.');

window.onload = function() {
  var circle;
  paper.install(window);
  paper.setup('container');
  circle = new Path.Circle({
    center: [80, 50],
    radius: 30,
    strokeColor: 'black'
  });
  return view.update();
};
