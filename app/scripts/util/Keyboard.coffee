class Ld30.Util.Keyboard
    pressed: {}

    listen: ->

    isDown: (keyCode) ->
        if @pressed.hasOwnProperty(keyCode) then @pressed[keyCode] else false

    onKeyDown: (event) ->
        @pressed[event.keyCode] = true

    onKeyUp: (event) ->
        delete @pressed[event.keyCode]

    listen: () ->
        window.addEventListener 'keyup', (event) =>
            this.onKeyUp event

        window.addEventListener 'keydown', (event) =>
            this.onKeyDown event

    LEFT: 37
    UP: 38
    RIGHT: 39
    DOWN: 40

    Q: 81
    E: 69

    H: 72
    N: 78

    W: 87
    A: 65
    S: 83
    D: 68

    FIRE: @Q
