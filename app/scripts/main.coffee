window.Ld48 =
  Commands: {}
  Display: {}
  Entities: {}
  Util: {}
  init: ->
    console.log 'Ld48 init'

# Shim for requestAnimationFrame
window.requestAnimFrame = (->
    window.requestAnimationFrame       ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame    ||
    (callback) ->
        window.setTimeout(callback, 1000 / 60)
)()

window.currentTimeMilliseconds = (->
    (window.performance && performance.now) ||
    ->
        new Date().getMilliseconds();
)()

document.addEventListener 'DOMContentLoaded', ->
  Ld48.init()
  canvas = document.querySelector 'canvas'

  canvas.width = 1024
  canvas.height = 768

  game = window.game = new Ld48.Game(canvas)

  game.start()

  true
