# Contains the game core components,
# such as the game loop, update, and render calls.
class Ld30.Core
    running: false
    debug: false # This will log a ton of data to the console if set to true

    imageSmoothing: false

    stats: new Stats()

    constructor: (@canvas) ->
        @context = @canvas.getContext('2d')
        @context.imageSmoothingEnabled = @imageSmoothing

        # The current view contains everything specific to the current game "stage",
        # such as player or AI entities, the current keyboard handler, etc.
        @currentView = new Ld30.Views.GameView(@canvas.width, @canvas.height)

        @currentView.render(@context)

        document.body.appendChild(@stats.domElement)

    # Game loop

    then: 0
    buffer: 0
    tick_frequency: 20 # How often the simulation gets updated (in milliseconds)
                       # 1 second / 20 ms == 50 Hertz

    gameLoop: =>
        @stats.begin()
        now = performance.now()
        delta = now - @then # Time difference from the last tick
        @buffer += delta    # Add the amount of passed time to the buffer

        console.log "time: ", now, " delta: ", delta if @debug

        while(@buffer >= @tick_frequency)
            local_delta = @buffer - @tick_frequency
            this.update(@tick_frequency)
            console.log "updated at:", now, " tick_frequency: ", @tick_frequency, " local delta: ", local_delta if @debug
            @buffer -= @tick_frequency

        this.render() if @currentView.wantsRendering
        console.log "rendered at:", now, " local delta: ", local_delta if @debug

        @then = now
        @stats.end()

        # Start the next loop iteration
        requestAnimFrame(this.gameLoop) if @running

    update: (delta) ->
        @currentView.update(delta)

    render: ->
        @context.clearRect(0, 0, @canvas.width, @canvas.height);
        @currentView.render(@context)

    start: ->
        @running = true
        @then = performance.now()
        this.gameLoop() # Kick off the game loop

    stop: ->
        @running = false

    togglePause: ->
        if @running then this.stop() else this.start()
