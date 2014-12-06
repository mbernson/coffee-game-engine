Ld30.entitiesColliding = (e1, e2) ->
    return ( e1.x < e2.x + e2.width &&
             e1.x + e1.width > e2.x &&
             e1.y < e2.y + e2.height &&
             e1.height + e1.y > e2.y )
