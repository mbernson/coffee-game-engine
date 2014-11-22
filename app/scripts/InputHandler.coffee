MoveCommand = Ld30.Commands.MoveCommand
FireCommand = Ld30.Commands.FireCommand
RotateCommand = Ld30.Commands.RotateCommand
ThrottleCommand = Ld30.Commands.ThrottleCommand

class Ld30.InputHandler
    constructor: (keyboard) ->
        @commands = []

        if keyboard
            @key = keyboard
        else
            @key = new Ld30.Util.Keyboard

        @key.listen()

    handle: (delta) ->
        move_unit = .25

        # if @key.isDown(@key.LEFT)  then @commands.push new MoveCommand(-move_unit * delta, 0)
        # if @key.isDown(@key.RIGHT) then @commands.push new MoveCommand(move_unit * delta, 0)

        if @key.isDown(@key.UP)     then @commands.push new ThrottleCommand(move_unit)
        if @key.isDown(@key.DOWN)   then @commands.push new ThrottleCommand(-move_unit)

        if @key.isDown(@key.SPACE)  then @commands.push new FireCommand()

        if @key.isDown(@key.LEFT)   then @commands.push new RotateCommand(-10)
        if @key.isDown(@key.RIGHT)  then @commands.push new RotateCommand(10)
        if @key.isDown(@key.Q)      then @commands.push new RotateCommand(-10)
        if @key.isDown(@key.E)      then @commands.push new RotateCommand(10)

    nextCommand: ->
        @commands.shift()
