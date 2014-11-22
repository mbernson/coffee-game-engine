class Ld30.Util.Keyboard
    pressed: {}

    isDown: (keyCode) ->
        if @pressed.hasOwnProperty(keyCode) then @pressed[keyCode] else false

    press: (keyCode) ->
        @pressed[keyCode] = true

    release: (keyCode) ->
        delete @pressed[keyCode]

    listen: ->
        window.addEventListener 'keyup', (event) =>
            this.release event.keyCode

        window.addEventListener 'keydown', (event) =>
            this.press event.keyCode

    LEFT: 37
    UP: 38
    RIGHT: 39
    DOWN: 40

    SPACE: 32

    Q: 81
    E: 69

    H: 72
    N: 78

    W: 87
    A: 65
    S: 83
    D: 68

    FIRE: @Q
