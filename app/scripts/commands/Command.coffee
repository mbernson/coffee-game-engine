class Ld30.Commands.Command
    execute: ->

    # The command cooldown stands for the time in milliseconds after which the
    # command can be triggered again. A cooldown of 0 allows the command to be
    # executed at every game tick, as specified in the `tick_frequency` Core class.
    cooldown: 0
