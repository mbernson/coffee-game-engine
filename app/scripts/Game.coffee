class Ld48.Game
    imageSmoothing: false

    constructor: (@canvas) ->
        @context = @canvas.getContext('2d')
        @context.imageSmoothingEnabled = @imageSmoothing

    start: ->
        console.log 'game started', @canvas, @context
