class KeyboardMock extends Ld30.Util.Keyboard
    press: (key) ->
        @pressed[key] = true

    release: (key) ->
        delete @pressed[key]

class PlayerMock extends Ld30.Entities.Player
    fired: false

    fire: ->
        @fired = true

# describe 'Input', ->
#     it 'Directs input to an appropriate command', ->

describe 'All together', ->
    it 'Chains', ->
        @keyboard = new KeyboardMock
        @player = new PlayerMock
        @input_handler = new Ld30.InputHandler

        @keyboard.press(KeyboardMock.FIRE)

        @input_handler.handle(@player)

        expect(@player.fired).to.equal(true)
