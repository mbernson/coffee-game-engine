class Ld30.Entities.Bullet extends Ld30.Entities.Entity
    direction: 0
    acceleration: 2
    width: 8
    height: 8

    update: (delta) ->
        @y -= @acceleration

    draw: (context) ->
        context.fillStyle = '#bebebe'
        context.fillRect(@x - @width / 2, @y - @height / 2,
            @width, @height)
