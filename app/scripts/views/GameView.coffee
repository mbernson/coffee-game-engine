Invader = Ld30.Entities.Invader
Bullet = Ld30.Entities.Bullet

class Ld30.Views.GameView extends Ld30.Views.View
    wantsRendering: true

    constructor: (width, height) ->
        @entities = []
        @bullets = []

        @player = new Ld30.Entities.Player()

        # Set the spawn location
        @player.x = width / 2
        @player.y = (height / 8) * 7

        @input_handler = new Ld30.InputHandler()
        this.spawnEnemies()

    removeEntity: (e) =>
        if e instanceof Bullet
            list = @bullets
        else
            list = @entities

        index = list.indexOf(e)
        list.splice(index, 1)

    spawnEnemies: ->
        rows = 4
        cols = 6
        padding_x = 49
        padding_y = 40
        i = 0

        for y in [1..rows]
            for x in [1..cols]
                invader = new Invader(x * 8 + x * padding_x, y * 8 + y * padding_y)
                invader.position = i
                invader.row_size = cols
                @entities.push(invader)
                i++

        console.log @entities

    render: (context) ->
        @player.draw(context)

        bullet.draw(context) for bullet in @bullets

        entity.draw(context) for entity in @entities

    update: (delta) ->
        @input_handler.handle(delta) # Fetch key events from the user

        # Let the player execute all unhandled commands
        while command = @input_handler.nextCommand()
            command.execute(@player, this)

        @player.update(delta)

        bullet.update(delta) for bullet in @bullets

        removeEntity = this.removeEntity
        for entity in @entities
            unless entity == null || entity == undefined
                entity.update(delta, this)
                this.checkBulletCollisions(entity, (e1, e2) ->
                    removeEntity(e1)
                    removeEntity(e2)
                )

        if this.checkBulletCollisions(@player)
            window.game.stop()
            alert 'You were hit by a bullet!'

    checkBulletCollisions: (entity, callback) ->
        for bullet in @bullets
            if bullet.collidesWith(entity)
                callback(entity, bullet) if callback
                return true

        return false
