Invader = Ld30.Entities.Invader

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
        index = @entities.indexOf(e)
        @entities.splice(index, 1)

    spawnEnemies: ->
        rows = 4
        cols = 6
        padding_x = 49
        padding_y = 40

        for y in [1..rows]
            for x in [1..cols]
                invader = new Invader(x * 8 + x * padding_x, y * 8 + y * padding_y)
                @entities.push(invader)

    render: (context) =>
        @player.draw(context)

        bullet.draw(context) for bullet in @bullets

        entity.draw(context) for entity in @entities

    update: (delta) =>
        @input_handler.handle(delta) # Fetch key events from the user

        # Let the player execute all unhandled commands
        while command = @input_handler.nextCommand()
            command.execute(@player, this)

        @player.update(delta)

        bullet.update(delta) for bullet in @bullets

        for entity in @entities
            unless entity == null || entity == undefined
                entity.update(delta, this)
                this.checkCollisions(entity)

    checkCollisions: (entity) =>
        for bullet in @bullets
            if bullet.collidesWith(entity)
                this.removeEntity(entity)
