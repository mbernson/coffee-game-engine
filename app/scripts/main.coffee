window.Ld48 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    console.log 'Hello from Backbone!'

# Shim for requestAnimationFrame
window.requestAnimFrame = (->
    window.requestAnimationFrame       ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame    ||
    (callback) ->
        window.setTimeout(callback, 1000 / 60)
)()


document.addEventListener 'DOMContentLoaded', ->
  Ld48.init();
  canvas = document.querySelector 'canvas'

  canvas.width = 1024
  canvas.height = 768

  game = window.game = new Ld48.Game(canvas)

  console.log 'starting game'
  game.start()

  true
