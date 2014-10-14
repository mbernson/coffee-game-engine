class Ld30.Commands.RotateCommand extends Ld30.Commands.Command
    constructor: (@direction) ->

    execute: (actor) ->
        actor.rotate @direction
