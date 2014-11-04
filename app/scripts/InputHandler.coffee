MoveCommand = Ld30.Commands.MoveCommand
FireCommand = Ld30.Commands.FireCommand
RotateCommand = Ld30.Commands.RotateCommand

class Ld30.InputHandler
    constructor: (keyboard) ->
        @commands = []
        @key = keyboard ? keyboard : new Ld30.Util.Keyboard
        @key.listen()

    handle: ->
        if @key.isDown(@key.LEFT)  then @commands.push new MoveCommand(-10, 0)
        if @key.isDown(@key.RIGHT) then @commands.push new MoveCommand(10, 0)

        if @key.isDown(@key.UP)    then @commands.push new MoveCommand(0, 10)
        if @key.isDown(@key.DOWN)  then @commands.push new MoveCommand(0, -10)

        if @key.isDown(@key.SPACE) then @commands.push new FireCommand()

        if @key.isDown(@key.Q)     then @commands.push new RotateCommand(-10)
        if @key.isDown(@key.E)     then @commands.push new RotateCommand(10)

    nextCommand: ->
        @commands.shift()

    # Unused

    max_length: 10
    trimQueue: ->
        while @commands.length > @max_length
            @commands.shift()
