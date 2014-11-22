class Ld30.Views.GameView extends Ld30.Views.View
    wantsRendering: true

    constructor: (width, height) ->
        @player = new Ld30.Entities.Player()
        @player.x = width / 2
        @player.y = height / 2

        @input_handler = new Ld30.InputHandler()

    render: (context) ->
        @player.draw(context)

    update: (delta) ->
        @input_handler.handle(delta) # Fetch key events from the user

        # Let the player execute all unhandled commands
        while command = @input_handler.nextCommand()
            command.execute(@player)

        @player.update(delta)
