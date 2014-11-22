MoveCommand = Ld30.Commands.MoveCommand
FireCommand = Ld30.Commands.FireCommand

class Ld30.InputHandler
    constructor: (keyboard) ->
        @commands = []

        if keyboard then @key = keyboard
        else @key = new Ld30.Util.Keyboard

        @key.listen()

    handle: (delta) ->
        step = 4
        if @key.isDown(@key.LEFT)  then @commands.push new MoveCommand(-step, 0)
        if @key.isDown(@key.RIGHT) then @commands.push new MoveCommand(step, 0)

        if @key.isDown(@key.SPACE) then @commands.push new FireCommand()

    nextCommand: ->
        @commands.shift()
