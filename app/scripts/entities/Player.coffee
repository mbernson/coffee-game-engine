Bullet = Ld30.Entities.Bullet

class Ld30.Entities.Player extends Ld30.Entities.Entity
    width: 32
    height: 32

    move: (x, y) ->
        @x += x

    fire: (field) ->
        @fired ||= 0
        @fired++
        field.bullets.push(new Bullet(@x - 8, @y - 12))

    draw: (context) ->
        context.save()
        context.translate(this.x - this.width / 2, this.y - this.height / 2)
        context.drawImage(Ld30.Entities.Player.sprite,
            -(this.width / 2) + 8, -(this.height / 2) + 8,
            this.width, this.height)
        context.restore()

Ld30.Entities.Player.sprite = ( ->
    img = new Image()
    img.src = 'images/ship_large.png'
    return img
)()
