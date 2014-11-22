document.addEventListener 'DOMContentLoaded', ->
    return false if mocha?

    canvas = document.querySelector 'canvas'

    canvas.width = 800
    canvas.height = 600

    game = window.game = new Ld30.Core(canvas)

    game.start()

    pause = document.createElement('button')
    pause.textContent = 'Pause'
    pause.addEventListener 'click', (event) =>
        if game.running then game.stop() else game.start()
        event.target.textContent = if game.running then 'Pause' else 'Resume'
        true

    document.body.appendChild(pause)

    true
