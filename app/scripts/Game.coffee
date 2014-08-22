class Ld48.Game
    chunks: []

    imageSmoothing: false

    constructor: (@canvas) ->
        @context = @canvas.getContext('2d')
        @context.imageSmoothingEnabled = @imageSmoothing

        @running = false
        @debug = true

        @player = new Ld48.Entities.Player
        @input_handler = new Ld48.InputHandler

    gameLoop: =>
        this.update()
        this.render()

        requestAnimFrame(this.gameLoop) if @running

    deltaTime: 0
    runningTime: 0

    update: ->
        currentTime = performance.now()
        @deltaTime = Math.abs(currentTime - @runningTime)
        @runningTime = currentTime

        console.log "time:", currentTime, "delta:", @deltaTime if @debug

        @input_handler.handle(@player)
        @player.update(@deltaTime)
        this.updateEnemies()

    updateEnemies: ->

    render: ->
        @player.draw(@context)

    start: ->
        chunk = new Ld48.Display.Chunk()
        chunk.fill new Ld48.Display.Tile()

        console.log chunk

        @running = false
        this.gameLoop() # Kick off the game loop

    stop: ->
        @running = false

    togglePause: ->
        if @running this.stop() else @this.start()
