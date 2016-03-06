console.log 'Coffee compiles.'

# Only run our code once the DOM is ready.
window.onload = ->
  # Set up paper.js
  paper.install window
  paper.setup 'container'
  # Draw something
  circle = new Path.Circle(
    center: [80, 50],
    radius: 30,
    strokeColor: 'black'
  )
  view.update()
