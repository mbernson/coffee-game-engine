MoveCommand = Ld48.Commands.MoveCommand
FireCommand = Ld48.Commands.FireCommand

class Ld48.InputHandler
    constructor: ->
        @key = new Ld48.Util.Keyboard
        @key.listen()

    handle: (actor) ->
        if @key.isDown(@key.LEFT)  then new MoveCommand(-10, 0).execute(actor)
        if @key.isDown(@key.RIGHT) then new MoveCommand(10, 0).execute(actor)

        if @key.isDown(@key.UP)   then new MoveCommand(0, 10).execute(actor)
        if @key.isDown(@key.DOWN) then new MoveCommand(0, -10).execute(actor)

        if @key.isDown(@key.Q) then new FireCommand().execute(actor)
