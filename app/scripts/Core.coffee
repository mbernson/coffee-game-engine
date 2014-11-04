class Ld30.Core
    chunks: []

    imageSmoothing: false

    constructor: (@canvas) ->
        @context = @canvas.getContext('2d')
        @context.imageSmoothingEnabled = @imageSmoothing

        @running = false
        @debug = false

        @player = new Ld30.Entities.Player()
        @input_handler = new Ld30.InputHandler()

        # @currentView = new Ld30.Views.TitleScreen()
        @currentView = new Ld30.Views.GameView(@player)
        @currentView.render(@context)

    gameLoop: =>
        this.handleInput()
        this.update()
        this.render() if @currentView.wantsRendering

        # Start the next loop iteration
        requestAnimFrame(this.gameLoop) if @running

    handleInput: ->
        @input_handler.handle() # Fetch the current key events

        while command = @input_handler.nextCommand()
            command.execute(@player)

    deltaTime: 0
    runningTime: 0

    update: ->
        currentTime = performance.now()
        @deltaTime = Math.abs(currentTime - @runningTime)
        @runningTime = currentTime

        console.log "time:", currentTime, "delta:", @deltaTime if @debug

        @currentView.update(@deltaTime)

    render: ->
        @context.clearRect(0, 0, @canvas.width, @canvas.height);
        @currentView.render(@context)

    start: ->
        chunk = new Ld30.Display.Chunk()
        chunk.fill new Ld30.Display.Tile()

        @running = true
        this.gameLoop() # Kick off the game loop

    stop: ->
        @running = false

    togglePause: ->
        if @running then this.stop() else @this.start()
