window.Ld30 =
  Commands: {}
  Display: {}
  Entities: {}
  Util: {}
  Views: {}
  init: ->
    console.log 'Ld30 init'

# Shim for requestAnimationFrame
window.requestAnimFrame =
    window.requestAnimationFrame       ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame    ||
    (callback) ->
        window.setTimeout(callback, 1000 / 60)

window.currentTimeMilliseconds =
    (window.performance && performance.now) ||
    ->
        new Date().getMilliseconds();

document.addEventListener 'DOMContentLoaded', ->
    return false if mocha?

    Ld30.init()

    canvas = document.querySelector 'canvas'

    canvas.width = 800
    canvas.height = 600

    game = window.game = new Ld30.Game(canvas)

    game.start()

    true
