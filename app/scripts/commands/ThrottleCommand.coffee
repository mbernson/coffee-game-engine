class Ld30.Commands.ThrottleCommand extends Ld30.Commands.Command
    constructor: (@amount) ->

    execute: (actor) ->
        console.log @amount
        actor.accelerate(@amount)
