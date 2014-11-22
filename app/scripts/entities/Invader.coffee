Bullet = Ld30.Entities.Bullet

class Ld30.Entities.Invader extends Ld30.Entities.Entity
    width: 16
    height: 16

    constructor: (@x, @y) ->
        @start_x = @x - 38
        @max_x = @x + 38

    change: 1

    move: ->
        if @x <= @start_x
            @change = 1
        else if @x >= @max_x
            @change = -1

        @x_pos += @change
        @x += @change

    update: (delta, field) ->
        this.move()
        if Math.random() > 0.999
            this.fire(field)

    fire: (field) ->
        bullet = new Bullet(@x, @y)
        bullet.acceleration = -1
        field.bullets.push(bullet)

    draw: (context) ->
        context.fillStyle = '#000000'
        context.fillRect(@x - @width / 2, @y - @height / 2,
            @width, @height)
