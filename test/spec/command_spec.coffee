class PlayerMock extends Ld30.Entities.Player
    fired: false

    fire: =>
        @fired = true

describe 'Keyboard and inputhandler together', ->
    it 'passes key input to an entity', ->
        @keyboard = new Ld30.Util.Keyboard
        @player = new PlayerMock
        @input_handler = new Ld30.InputHandler(@keyboard)

        @keyboard.press(@keyboard.SPACE)

        @input_handler.handle(@player)

        while command = @input_handler.nextCommand()
            command.execute(@player)

        expect(@player.fired).to.equal(true)
