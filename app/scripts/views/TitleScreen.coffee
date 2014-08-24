class Ld30.Views.TitleScreen extends Ld30.Views.View
    render: (context) ->
        console.log 'title screen render'
        @drawHeader context
        @drawButtons context

    drawHeader: (context) ->
        context.font = '64pt Arial'
        context.textAlign = 'center'
        context.fillText("Zombie game", 400, 120)

    drawButtons: (context) ->
