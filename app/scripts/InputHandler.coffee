MoveCommand = Ld30.Commands.MoveCommand
FireCommand = Ld30.Commands.FireCommand

class Ld30.InputHandler
    constructor: (keyboard) ->
        # Holds the command queue.
        @commands = []

        # This hash keeps the remaining cooldown time
        # after a certain key was last pressed.
        @command_table = {}

        if keyboard then @key = keyboard
        else @key = new Ld30.Util.Keyboard

        @key.listen()

    handle: (delta) ->
        this.updateCooldown(delta)

        step = 4

        if @key.isDown(@key.LEFT)  then @commands.push new MoveCommand(-step, 0)
        if @key.isDown(@key.RIGHT) then @commands.push new MoveCommand(step, 0)

        if @key.isDown(@key.SPACE) then this.addCommand(@key.SPACE, new FireCommand())

    updateCooldown: (delta) ->
        for key, remaining_time of @command_table
            @command_table[key] = remaining_time - delta

    addCommand: (key, command) ->
        # Add the key to the table if necessary
        unless @command_table.hasOwnProperty(key)
            @command_table[key] = 0

        # Add the new command only if the cooldown time ran out
        if @command_table[key] <= 0
            @commands.push(command)
            @command_table[key] = command.cooldown

    nextCommand: ->
        @commands.shift()
