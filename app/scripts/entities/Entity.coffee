class Ld30.Entities.Entity
    height: 0
    width: 0

    solid: false

    constructor: (@x = 0, @y = 0) ->

    update: (delta) ->

    draw: (context) ->

    move: (@x, @y) ->

    collidesWith: (entity) ->
        return Ld30.entitiesColliding(this, entity)
