# LD48 CoffeeScript game engine

This is a toy game engine written in CoffeeScript. It was extracted from a game I made for the [Ludum Dare 48 hour game jam](http://ludumdare.com/compo/).
The project is intended to serve as a foundation for quickly building browser games with coffeescript. It includes components such as the game loop and input handling using the command pattern.

## Setup & development

### Install Node.js

You must have Node.js installed on your machine to build and run your game. Grab the installer for Mac OS or Windows from [the Node website](http://nodejs.org/) or install it using a package manager.

### Global dependencies

Install Grunt, Bower and CoffeeScript globally by running `npm install -g grunt-cli bower coffee-script`.

### Get the code and run it

Clone the project and run this in the root directory:

```
$ npm install
$ bower install
$ grunt serve
```

A browser window will open automatically, reloading your code whenever you save it. You can run `grunt serve` again at a later time to start the development server.

## Testing

Tests can be written using [Mocha](http://mochajs.org) and [Chai](http://chaijs.com), and are located in the `test/` directory.

First, run `bower install` in the `test/` directory. After that, you can run `grunt test` to execute the tests.

## Deployment

The `grunt build` command will generate a minified, release version in the `dist/` folder.
Deploy this on a webserver or something.

## License

MIT Licensed, see the `LICENSE` file.
