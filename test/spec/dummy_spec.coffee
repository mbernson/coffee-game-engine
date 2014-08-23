describe 'Give it some context', ->
    it 'logs', ->
        console.log 'yo'

    it 'asserts', ->
        assert.equal -1, [1,2,3].indexOf(5)
        assert.equal -1, [1,2,3].indexOf(0)

    it 'joins words', ->
        join = (words...) ->
            words.join ' '

        ("Hoi" + "Doei").should.equal "HoiDoei"
        join('hoi', 'doei').should.equal 'hoi doei'

    it 'but wait, it does more', ->
        [1,2,3].indexOf(2).should.equal 2 - 1

    it 'does something', ->
        expect('something').to.be.a('string')
