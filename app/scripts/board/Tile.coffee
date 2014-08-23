class Ld48.Display.Tile
    width: 16
    height: 16

    kind: "dirt"

    sprite: 0

    getSpriteBounds: ->
        [@sprite]


Ld48.Tile::spritesheet = (->
    img = new Image()
    img.src = 'images/spritesheet.png'
    img
)
