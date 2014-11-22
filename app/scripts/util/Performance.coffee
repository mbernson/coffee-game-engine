# Shim for requestAnimationFrame
window.requestAnimFrame =
    window.requestAnimationFrame       ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame    ||
    (callback) ->
        window.setTimeout(callback, 1000 / 60)

window.currentTimeMilliseconds =
    (window.performance && performance.now) ||
    ->
        new Date().getMilliseconds();
