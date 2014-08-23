class Ld30.Display.Tile
    width: 16
    height: 16

    kind: "dirt"

    sprite: 0

    getSpriteBounds: ->
        [@sprite]


Ld30.Tile::spritesheet = (->
    img = new Image()
    img.src = 'images/spritesheet.png'
    img
)
