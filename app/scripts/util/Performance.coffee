# Shim for requestAnimationFrame
window.requestAnimFrame =
    window.requestAnimationFrame       ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame    ||
    (callback) ->
        window.setTimeout(callback, 1000 / 60)

window.currentTimeMilliseconds = (->
    if window.performance && window.performance.now
        return -> window.performance.now()
    else
        return -> new Date().getMilliseconds()
)()
