Bullet = Ld30.Entities.Bullet

class Ld30.Entities.Invader extends Ld30.Entities.Entity
    width: 16
    height: 16

    constructor: (@x, @y) ->
        @min_x = @x - 38
        @max_x = @x + 38

    step: 0.5

    move: ->
        if @x <= @min_x # When hitting the left wall
            @step = Math.abs @step
            @y += 8
        else if @x >= @max_x # Or hitting the right wall
            @step = - @step
            @y += 8

        @x += @step

    update: (delta, field) ->
        this.move()

        for entity in field.entities
            if ((@position % @row_size) == (entity.position % @row_size)) && entity.position > @position
                return

        if Math.random() > 0.999
            # This is currently buggy :(
            # this.fire(field)

    fire: (field) ->
        bullet = new Bullet(@x, @y)
        bullet.acceleration = -1
        field.bullets.push(bullet)

    draw: (context) ->
        context.fillStyle = '#000000'
        context.fillRect(@x - @width / 2, @y - @height / 2,
            @width, @height)
