class Ld30.Views.GameView extends Ld30.Views.View
    wantsRendering: true

    constructor: ->
        @player = new Ld30.Entities.Player()

    render: (context) ->
        @player.draw(context)

    update: (delta) ->
        @player.update(delta)
