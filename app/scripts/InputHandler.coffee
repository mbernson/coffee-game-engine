MoveCommand = Ld30.Commands.MoveCommand
FireCommand = Ld30.Commands.FireCommand

class Ld30.InputHandler
    constructor: (keyboard) ->
        @commands = []

        if keyboard then @key = keyboard
        else @key = new Ld30.Util.Keyboard

        @key.listen()

    handle: (delta) ->
        # Add your commands in the form of:
        # if @key.isDown(@key.SOMETHIGN) then @commands.push new MoveCommand(x, y)

    nextCommand: ->
        @commands.shift()
