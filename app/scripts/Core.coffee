# Contains the game core components,
# such as the game loop, update, and render calls.
class Ld30.Core
    running: false
    debug: false

    imageSmoothing: false

    constructor: (@canvas) ->
        @context = @canvas.getContext('2d')
        @context.imageSmoothingEnabled = @imageSmoothing

        @player = new Ld30.Entities.Player()
        @input_handler = new Ld30.InputHandler()

        # @currentView = new Ld30.Views.TitleScreen()
        @currentView = new Ld30.Views.GameView(@player)
        @currentView.render(@context)

    # The game loop

    then: performance.now()
    buffer: 0
    tick: 50 # Amount of milliseconds after which the game updates

    gameLoop: =>
        now = performance.now()
        delta = now - @then
        @buffer += delta

        console.log "time: ", now, " delta: ", delta if @debug

        while(@buffer >= @tick)
            console.log "updated at:", now, " tick: ", @tick if @debug
            this.update(@tick)
            @buffer -= @tick;

        this.render() if @currentView.wantsRendering
        @then = now

        # Start the next loop iteration
        requestAnimFrame(this.gameLoop) if @running

    handleInput: ->
        @input_handler.handle() # Fetch the current key events

        while command = @input_handler.nextCommand()
            command.execute(@player)

    update: (delta) ->
        this.handleInput(delta)

        @currentView.update(delta)

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
