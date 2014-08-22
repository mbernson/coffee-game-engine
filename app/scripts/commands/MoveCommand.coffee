class Ld48.Commands.MoveCommand extends Ld48.Commands.Command
    constructor: (@x, @y) ->

    execute: (actor) ->
        actor.move(@x, @y)
