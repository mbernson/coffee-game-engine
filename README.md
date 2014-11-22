# LD48 CoffeeScript game engine

This is a toy game engine written in CoffeeScript. It was extracted from a game I made for the [Ludum Dare 48 hour game jam](http://ludumdare.com/compo/).

## Setup & development

**Prerequisites**: You must have Node.js installed.

Install Grunt, Bower and CoffeeScript globally by running `npm install -g grunt-cli bower coffee-script`.

Clone the project and run this in the root directory:

```
$ npm install
$ bower install
$ grunt serve
```

A browser window will open automatically.

## Testing

Tests are written using [Mocha](http://mochajs.org) and [Chai](http://chaijs.com), and are located in the `test/` directory.

First, run `bower install` in the `test/` directory. After that, you can run `grunt test` to execute the tests.

## Deployment

The `grunt build` command will generate a minified, release version in the `dist/` folder. Deploy this anywhere you'd like.

## License

MIT Licensed, see the `LICENSE` file.
