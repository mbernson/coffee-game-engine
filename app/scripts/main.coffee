document.addEventListener 'DOMContentLoaded', ->
    return false if mocha?

    canvas = document.querySelector 'canvas'

    canvas.width = 800
    canvas.height = 600

    game = window.game = new Ld30.Core(canvas)

    game.start()

    true
