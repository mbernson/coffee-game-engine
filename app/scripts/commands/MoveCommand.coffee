class Ld30.Commands.MoveCommand extends Ld30.Commands.Command
    constructor: (@x, @y) ->

    execute: (actor) ->
        actor.move(@x, @y)
