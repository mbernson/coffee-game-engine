class Ld30.Views.TitleScreen extends Ld30.Views.View
    render: (context) ->
        @drawHeader context
        @drawButtons context

    drawHeader: (context) ->
        context.font = '64pt Arial'
        context.textAlign = 'center'
        context.fillText("Game title", 400, 120)

    drawButtons: (context) ->
