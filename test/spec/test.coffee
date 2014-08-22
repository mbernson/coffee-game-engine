(->
    'use strict'

    describe 'Give it some context', ->
        describe 'maybe a bit more context here', ->
            it 'should run here few assertions', ->
                console.log 'yo'
                assert.equal -1, [1,2,3].indexOf(5)
                assert.equal -1, [1,2,3].indexOf(0)

                [1,2,3].indexOf(2).should.equal 2 - 1
                ("Hoi" + "Doei").should.equal "Hoei"
)()
