MoveCommand = Ld30.Commands.MoveCommand
FireCommand = Ld30.Commands.FireCommand

class Ld30.InputHandler
    commands: [] # Command pipeline

    constructor: ->
        @key = new Ld30.Util.Keyboard
        @key.listen()

    handle: (actor) ->
        if @key.isDown(@key.LEFT)  then @commands.push new MoveCommand(-10, 0).execute(actor)
        if @key.isDown(@key.RIGHT) then @commands.push new MoveCommand(10, 0).execute(actor)

        if @key.isDown(@key.UP)    then @commands.push new MoveCommand(0, 10).execute(actor)
        if @key.isDown(@key.DOWN)  then @commands.push new MoveCommand(0, -10).execute(actor)

        if @key.isDown(@key.Q)     then @commands.push new FireCommand().execute(actor)
