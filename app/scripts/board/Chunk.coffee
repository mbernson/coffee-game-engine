class Ld48.Display.Chunk
	tiles: []
	hierarchy: {}

	constructor: (@width = 16, @height = 16) ->

	getTile: (x, y) ->
		@hierarchy?[y]?[x]

	fill: (tile) ->
		for y in [0..@height]
			@hierarchy[y] ||= {}
			for x in [0..@width]
				@hierarchy[x] ||= tile
