class Ld30.Entities.Player extends Ld30.Entities.Entity
    constructor: ->
        @direction = 55
        @acceleration = 2

        @width = 32
        @height = 32

        @x = 0
        @y = 0

    toRadians: (degrees) ->
        return degrees / 180 * Math.PI;

    rotate: (amount) ->
        @direction += amount

    stop: ->
        @acceleration = 0

    accelerate: (amount) ->
        @acceleration += amount

    move: (x, y) ->
        @x += x
        @y += y

    fire: ->
        @fired ||= 0
        @fired++

    update: (delta) ->
        if this.x <= 0 || this.x >= 800 then this.direction += 90
        if this.y <= 0 || this.y >= 600 then this.direction += 90

        dx = Math.sin(@toRadians(this.direction))
        dy = -Math.cos(@toRadians(this.direction))

        dx *= this.acceleration
        dy *= this.acceleration

        this.move(dx, dy)

    draw: (context) ->
        context.save();
        context.translate(this.x - this.width / 2, this.y - this.height / 2);
        context.rotate(@toRadians(this.direction));
        context.drawImage(Ld30.Entities.Player.sprite,
            -(this.width / 2), -(this.height / 2),
            this.width, this.height);
        context.restore();

Ld30.Entities.Player.sprite = ( ->
    img = new Image()
    img.src = 'images/ship_large.png'
    return img
)();
