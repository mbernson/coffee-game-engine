class Ld30.Util.SpriteSheet

    constructor: (@src) ->
        @image = new Image()
        @image.src = @src

    width: -> @image.width

    height: -> @image.height
