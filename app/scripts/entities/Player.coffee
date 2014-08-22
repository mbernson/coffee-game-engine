class Ld48.Entities.Player extends Ld48.Entities.Entity
    @direction = 0

    move: (x, y) ->
        @x += x
        @y += y
        console.log 'player moved to', @x, @y

    fire: ->
        @fired ||= 0
        @fired++
        console.log 'player fired', @fired, 'shots so far!'

    update: (delta) ->

    draw: (context) ->
